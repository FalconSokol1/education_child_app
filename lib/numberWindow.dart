import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberWindow extends StatefulWidget {
  const NumberWindow({Key? key});

  @override
  State<NumberWindow> createState() => _HomePageState();
}

class _HomePageState extends State<NumberWindow> {
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
              height: 160,
              width: 400,
              child:
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                    height: 150,
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
                      Text(
                        'ВАЯ ОТГАДАЙ СЕМАК ПО ЦВЕТУ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
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
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Ink.image(
                                      image: AssetImage('assets/semak1.jpg'),
                                      fit: BoxFit.fill,
                                      width: 100,
                                      height: 100,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'мужское даю',
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
                                      image: AssetImage('assets/semak2.jpg'),
                                      fit: BoxFit.fill,
                                      width: 100,
                                      height: 100,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'бродяжная',
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
                                      image: AssetImage('semak3.jpg'),
                                      fit: BoxFit.fill,
                                      width: 100,
                                      height: 100,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'семачело',
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
            SizedBox(
              height: 25,
            ),
            Padding(
          padding: EdgeInsets.all(10),
          child:
                Center(
                  child:
                  ElevatedButton(
                    onPressed: () {Navigator.pop(context);},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 50,
                      color: const Color(0xFFC71A4F),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

}