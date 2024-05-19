import 'package:audioplayers/audioplayers.dart';
import 'package:education_child_app/lernNumber.dart';
import 'package:flutter/material.dart';


class LearnNumberWindow extends StatefulWidget {
  const LearnNumberWindow({Key? key});

  @override
  State<LearnNumberWindow> createState() => _LearnNumberWindowWindowState();

}


class _LearnNumberWindowWindowState extends State<LearnNumberWindow> {
  static AudioPlayer player = new AudioPlayer();
  late bool _isVisible = false;
  late String numberOnText = "";
  late String soundNumber;
  final List<NumberCard> number = WordList.getNumber();

  int score = 0;

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


  void playSoundWord(btn) {
    setState(() {
      numberOnText = number[btn].text;
      soundNumber = number[btn].sound;
      player.play(AssetSource(soundNumber));
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
                      height: 110,
                      width: 450,
                      child:
                      Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 90,
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
                                    "Учим цифры", textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Цифра: $numberOnText',
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
                height: 200,
                child: Column(
                  children: [
                    Container(
                        height: 90,
                        width: 420,
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
                                    splashColor: Colors.red,
                                    onTap: () {
                                      int btn = 0;
                                      playSoundWord(btn);
                                    },
                                    child: Column(
                                      children: [
                                        Ink.image(
                                          image: AssetImage(number[0].number),
                                          width: 80,
                                          height: 90,
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
                                    splashColor: Colors.orangeAccent,
                                    onTap: () {
                                      int btn = 1;
                                      playSoundWord(btn);
                                    },
                                    child: Column(
                                      children: [
                                        Ink.image(
                                          image: AssetImage(number[1].number),
                                          width: 80,
                                          height: 90,
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
                                    splashColor: Colors.yellow,
                                    onTap: () {
                                      int btn = 2;
                                      playSoundWord(btn);
                                    },
                                    child: Column(
                                      children: [
                                        Ink.image(
                                          image: AssetImage(number[2].number),
                                          width: 80,
                                          height: 90,
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
                                    splashColor: Colors.lightGreen,
                                    onTap: () {
                                      int btn = 3;
                                      playSoundWord(btn);

                                    },
                                    child: Column(
                                      children: [
                                        Ink.image(
                                          image: AssetImage(number[3].number),
                                          width: 80,
                                          height: 90,
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
                                    splashColor: Colors.blue,
                                    onTap: () {
                                      int btn = 4;
                                      playSoundWord(btn);
                                    },
                                    child: Column(
                                      children: [
                                        Ink.image(
                                          image: AssetImage(number[4].number),
                                          width: 80,
                                          height: 90,
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
                    SizedBox(height: 10,),
                    Container(
                        height: 90,
                        width: 420,
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
                                    splashColor: Colors.indigo,
                                    onTap: () {
                                      int btn = 5;
                                      playSoundWord(btn);
                                    },
                                    child: Column(
                                      children: [
                                        Ink.image(
                                          image: AssetImage(number[5].number),
                                          width: 80,
                                          height: 90,
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
                                    splashColor: Colors.purpleAccent,
                                    onTap: () {
                                      int btn = 6;
                                      playSoundWord(btn);
                                    },
                                    child: Column(
                                      children: [
                                        Ink.image(
                                          image: AssetImage(number[6].number),
                                          width: 80,
                                          height: 90,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Material(
                                    color: const Color(0xFFF4F4FB),
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    splashColor: Colors.purple,
                                    onTap: () {
                                      int btn = 7;
                                      playSoundWord(btn);
                                    },
                                    child: Column(
                                      children: [
                                        Ink.image(
                                          image: AssetImage(number[7].number),
                                          width: 80,
                                          height: 90,
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
                                    splashColor: Colors.deepPurple,
                                    onTap: () {
                                      int btn = 8;
                                      playSoundWord(btn);
                                    },
                                    child: Column(
                                      children: [
                                        Ink.image(
                                          image: AssetImage(number[8].number),
                                          width: 80,
                                          height: 90,
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
                                    splashColor: Colors.orange,
                                    onTap: () {
                                      int btn = 9;
                                      playSoundWord(btn);
                                    },
                                    child: Column(
                                      children: [
                                        Ink.image(
                                          image: AssetImage(number[9].number),
                                          width: 80,
                                          height: 90,
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
                height: 10,),
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