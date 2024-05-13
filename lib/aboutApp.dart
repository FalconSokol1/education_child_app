import 'package:flutter/material.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key? key});

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {

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
    child:  Text(
      'Данное приложение было разработано студенткой группы ИС-42 Чич Зулимой ',
       textAlign: TextAlign.center,
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 20,
    ),
    ),
    ),
    ),]
    )
    ,),
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
    ])
    ));
  }
}




