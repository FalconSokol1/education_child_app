import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_child_app/taskWord.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordWindow extends StatefulWidget {
  const WordWindow({Key? key});

  @override
  State<WordWindow> createState() => _WordWindowState();
}

class _WordWindowState extends State<WordWindow> {
  late bool _isVisible = false;
  late String soundWord;
  static AudioPlayer player = new AudioPlayer();
  final List<TaskWord> tasks = TaskList.getTasks();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late bool newPlayer = true;

  int score = 0;
  int currentTaskIndex = 0;
  int numberWord = 0;
  String collectedWord = "";

  void playSoundNumber() {
    setState(() {
      soundWord = tasks[currentTaskIndex].audioWord;
      player.play(AssetSource(soundWord));
    });
  }

  @override
  void initState() {
    super.initState();

    // Установим начальное значение видимости текста как false
    _isVisible = false;
    playSoundNumber();

    // Установим задержку перед началом анимации
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  void checkAnswer(String button) {
    setState(() {
      collectedWord += button; // Добавляем букву к собранному слову
      print("Собранное слово: $collectedWord");
      print("Правильное слово: ${tasks[currentTaskIndex].word}");

      if (collectedWord.length == tasks[currentTaskIndex].correct_number) {
        // Проверяем правильность собранного слова
        if (collectedWord == tasks[currentTaskIndex].word) {
          score++;
          print("Ответ правильный");
        } else {
          print("Ответ неправильный");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Ответ неправильный'),
          ));
        }

        collectedWord = ''; // Сбрасываем собранное слово

        // Проверяем, находится ли currentTaskIndex в диапазоне допустимых индексов
        if (currentTaskIndex < tasks.length - 1) {
          currentTaskIndex++; // Переходим к следующему заданию
          playSoundNumber(); // Проигрываем звук следующего слова

          // Плавная анимация для видимости элементов
          Future.delayed(Duration(milliseconds: 500), () {
            setState(() {
              _isVisible = true;
            });
          });
        } else {
          // Игра окончена
          addScores(score).then((_) {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Игра окончена'),
                content: Text('Ваши баллы: $score'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      score = 0;
                      currentTaskIndex = 0;
                      collectedWord = '';
                      playSoundNumber();
                    },
                    child: Text('Начать заново'),
                  ),
                ],
              ),
            );
          });
        }
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Center(
          child:Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 160,
                      width: 450,
                      child:
                      Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 390,
                              decoration: BoxDecoration(
                                color: const Color(0xFFC71A4F),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 5,
                                    spreadRadius: 3,
                                    color: const Color(0xFFC71A4F).withOpacity(.4),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedOpacity(
                                  opacity: _isVisible ? 1.0 : 0.0,
                                  duration: Duration(seconds: 1),
                                  child: Text(
                                    "Собери слово", textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Слово: $collectedWord',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ) ,]
                      )
                  ),
                ],),
              SizedBox(
                height: 140,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                        height: 110,
                        width: 800,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.withOpacity(.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:Stack(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Material(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    splashColor: Colors.grey,
                                    onTap: () {
                                      numberWord++;
                                        String button = tasks[currentTaskIndex].correct_word1;
                                        checkAnswer(button);
                                    },
                                    child: Column(
                                      children: [
                                        Ink.image(
                                          image: AssetImage(tasks[currentTaskIndex].word1),
                                          width: 100,
                                          height: 110,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    splashColor: Colors.grey,
                                    onTap: () {
                                      numberWord++;
                                        String button = tasks[currentTaskIndex].correct_word2;
                                        checkAnswer(button);
                                    },
                                    child: Column(
                                      children: [
                                        Ink.image(
                                          image: AssetImage(tasks[currentTaskIndex].word2),
                                          width: 100,
                                          height: 110,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    splashColor: Colors.grey,
                                    onTap: () {
                                      numberWord++;
                                        String button = tasks[currentTaskIndex].correct_word3;
                                        checkAnswer(button);
                                    },
                                    child: Column(
                                      children: [
                                        Ink.image(
                                          image: AssetImage(tasks[currentTaskIndex].word3),
                                          width: 100,
                                          height: 110,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    splashColor: Colors.grey,
                                    onTap: () {
                                      numberWord++;
                                      if (currentTaskIndex < tasks.length) {
                                        String button = tasks[currentTaskIndex].correct_word4;
                                        checkAnswer(button);
                                      }
                                    },
                                    child: Column(
                                      children: [
                                        Ink.image(
                                          image: AssetImage(tasks[currentTaskIndex].word4),
                                          width: 100,
                                          height: 110,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    splashColor: Colors.grey,
                                    onTap: () {
                                      numberWord++;

                                        String button = tasks[currentTaskIndex].correct_word5;
                                        checkAnswer(button);

                                    },
                                    child: Column(
                                      children: [
                                        Ink.image(
                                          image: AssetImage(tasks[currentTaskIndex].word5),
                                          width: 100,
                                          height: 110,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    splashColor: Colors.grey,
                                    onTap: () {
                                      numberWord++;

                                        String button = tasks[currentTaskIndex].correct_word6;
                                        checkAnswer(button);

                                    },
                                    child: Column(
                                      children: [
                                        Ink.image(
                                          image: AssetImage(tasks[currentTaskIndex].word6),
                                          width: 100,
                                          height: 110,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    splashColor: Colors.grey,
                                    onTap: () {
                                      numberWord++;
                                        String button = tasks[currentTaskIndex].correct_word7;
                                        checkAnswer(button);
                                    },
                                    child: Column(
                                      children: [
                                        Ink.image(
                                          image: AssetImage(tasks[currentTaskIndex].word7),
                                          width: 100,
                                          height: 110,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    splashColor: Colors.grey,
                                    onTap: () {
                                      numberWord++;

                                        String button = tasks[currentTaskIndex].correct_word8;
                                        checkAnswer(button);
                                    },
                                    child: Column(
                                      children: [
                                        Ink.image(
                                          image: AssetImage(tasks[currentTaskIndex].word8),
                                          width: 100,
                                          height: 110,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,),
              FloatingActionButton(
                heroTag: null,
                foregroundColor:  Colors.white,// <-- Text
                backgroundColor: const Color(0xFFC71A4F),
                child:Icon( // <-- Icon
                  Icons.arrow_back,
                  size: 24.0,
                ),
                onPressed: () {Navigator.pop(context);},
              ),
            ],
          ),
        )

    );
  }
  Future<void> addScores(int score) async {
    int resultGame = score;
    var userEmail = _firebaseAuth.currentUser!.email;
    var userDoc = FirebaseFirestore.instance.collection('Users').doc(userEmail);
    var numberSnapshot = await userDoc.get();
    var scoresNumber= numberSnapshot.data()!['ScoresNumber'] as int;

    var wordSnapshot = await userDoc.get();
    var scoresWord = wordSnapshot.data()!['ScoresWord'] as int;
    resultGame += scoresWord;
    print(resultGame);

    var resultGameDoc = FirebaseFirestore.instance.collection('ResultGames').doc(userEmail);
    var isUserReal = await resultGameDoc.get();
    if (!isUserReal.exists) {
      final user = {
        'Id': userEmail,
        'Name': _firebaseAuth.currentUser!.displayName,
        'NewPlayer': false,
        'NewPlayerNumber': false,
        'NewPlayerWord': false,
        'ScoresNumber': scoresNumber,
        'ScoresWord': resultGame,
      };
      await userDoc.set(user);
    } else {
      await userDoc.update({'ScoresWord': resultGame});
    }
  }


}