import 'package:education_child_app/taskWord.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordWindow extends StatefulWidget {
  const WordWindow({Key? key});

  @override
  State<WordWindow> createState() => _WordWindowState();
}

class _WordWindowState extends State<WordWindow> {
  late bool _isVisible = false;
  final List<TaskWord> tasks = TaskList.getTasks();

  int score = 0;
  int currentTaskIndex = 0;
  int numberWord = 0;
  String collectedWord = "";

  @override
  void initState() {
    super.initState();

    // Установим начальное значение видимости текста как false
    _isVisible = false;

    // Установим задержку перед началом анимации
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  void checkAnswer(button) {
    setState(() {
      collectedWord += button; // Добавляем букву к собранному слову
      if (collectedWord.length == tasks[currentTaskIndex].correct_number) {
        // Проверяем правильность собранного слова
        if (collectedWord == tasks[currentTaskIndex].word) {
          score++;
        }
        // Сбрасываем состояние для следующего задания
        collectedWord = '';
        currentTaskIndex = (currentTaskIndex + 1) % tasks.length;
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
                                  'Слово: $score',
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
                                     String button = tasks[currentTaskIndex].word1;
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
                                      String button = tasks[currentTaskIndex].word1;
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
                                      String button = tasks[currentTaskIndex].word1;
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
                                      String button = tasks[currentTaskIndex].word1;
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
                                      String button = tasks[currentTaskIndex].word1;
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
                                      String button = tasks[currentTaskIndex].word1;
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
                                      String button = tasks[currentTaskIndex].word1;
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
                                      String button = tasks[currentTaskIndex].word1;
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
}