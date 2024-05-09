import 'package:education_child_app/numberWindow.dart';
import 'package:education_child_app/wordWindow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _isVisible;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4FB),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              child:
              Text(
            'Обучащющее приложение\n для детей',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
            ),
            SizedBox(
              height: 380,
              width: 400,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 240,
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
                    child: Center(
                      child: AnimatedOpacity(
                          opacity: _isVisible ? 1.0 : 0.0,
                          duration: Duration(seconds: 1),
                        child: Text(
                          'САЛАМ УЦЫ, ДАВАЙ\n ЖИ ЕСТЬ ИГРАТЬ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 260,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/logoChildApp.jpeg'),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    width: 500,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Material(
                              color: const Color(0xFFC71A4F),
                              borderRadius: BorderRadius.circular(20),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>WordWindow()));},
                                child: Column(
                                  children: [
                                    Ink.image(
                                      image: AssetImage('assets/gameWord.jpeg'),
                                      fit: BoxFit.fill,
                                      width: 100,
                                      height: 100,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Буквы',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Material(
                              color: const Color(0xFFC71A4F),
                              borderRadius: BorderRadius.circular(20),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>NumberWindow()));},
                                child: Column(
                                  children: [
                                    Ink.image(
                                      image: AssetImage('assets/gameNumber.jpeg'),
                                      fit: BoxFit.fill,
                                      width: 100,
                                      height: 100,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Цифры',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Material(
                              color: const Color(0xFFC71A4F),
                              borderRadius: BorderRadius.circular(20),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Ink.image(
                                      image: AssetImage('assets/gamePaint.jpeg'),
                                      fit: BoxFit.fill,
                                      width: 100,
                                      height: 100,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Цвета',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Material(
                              color: const Color(0xFFC71A4F),
                              borderRadius: BorderRadius.circular(20),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Ink.image(
                                      image: AssetImage('assets/gameFigures.jpeg'),
                                      fit: BoxFit.fill,
                                      width: 100,
                                      height: 100,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Фигуры',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
