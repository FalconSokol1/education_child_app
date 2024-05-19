import 'package:audioplayers/audioplayers.dart';
import 'package:education_child_app/lernWord.dart';
import 'package:education_child_app/taskWord.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LearnWordWindow extends StatefulWidget {
  const LearnWordWindow({Key? key});

  @override
  State<LearnWordWindow> createState() => _LearnWordWindowState();
}

class _LearnWordWindowState extends State<LearnWordWindow> {
  static AudioPlayer player = new AudioPlayer();
  late bool _isVisible = false;
  late String soundWord;
  final List<Word> word = WordList.getTasks();

  int currentTaskIndex = 0;

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

  void playSoundNumber(currentTaskIndex) {
    setState(() {
      soundWord = word[currentTaskIndex].sound;
      player.play(AssetSource(soundWord));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Padding(
          padding: EdgeInsets.only(left: 50, right: 50),
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () {
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              word[currentTaskIndex].word,
                              width: 320,
                              height: 300,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],),
                  Column(children: [
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () {
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              word[currentTaskIndex].imageWord,
                              width: 300,
                              height: 270,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      word[currentTaskIndex].text, textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],),
                ],
              ),),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(children: [
                    FloatingActionButton(
                      heroTag: null,
                      foregroundColor:  Colors.white,// <-- Text
                      backgroundColor: const Color(0xFFC71A4F),
                      child:Icon(
                        Icons.arrow_back,
                        size: 24.0,
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ],),
                  Column(children: [
                    Row(children: [
                      FloatingActionButton(
                        heroTag: null,
                        foregroundColor:  Colors.white,// <-- Text
                        backgroundColor: const Color(0xFFC71A4F),
                        child:Icon(
                          Icons.keyboard_double_arrow_left,
                          size: 24.0,
                        ),
                        onPressed: () {
                          currentTaskIndex--;
                          setState(() {
                          });
                        },
                      ),
                      SizedBox(width: 20,),
                      FloatingActionButton(
                        heroTag: null,
                        foregroundColor:  Colors.white,// <-- Text
                        backgroundColor: const Color(0xFFC71A4F),
                        child:Icon(
                          Icons.play_arrow_sharp,
                          size: 24.0,
                        ),
                        onPressed: () {
                          playSoundNumber(currentTaskIndex);
                        },
                      ),
                      SizedBox(width: 20,),
                      FloatingActionButton(
                        heroTag: null,
                        foregroundColor:  Colors.white,// <-- Text
                        backgroundColor: const Color(0xFFC71A4F),
                        child:Icon(
                          Icons.keyboard_double_arrow_right,
                          size: 24.0,
                        ),
                        onPressed: () {
                          currentTaskIndex++;
                          setState(() {
                          });
                        },
                      ),
                    ],)
                  ],),
                ],
              ),
            ],
          ),
        )

    );
  }
}