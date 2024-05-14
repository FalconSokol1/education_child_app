import 'package:education_child_app/authService.dart';
import 'package:education_child_app/authWindow.dart';
import 'package:education_child_app/numberWindow.dart';
import 'package:education_child_app/wordWindow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'aboutApp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _isVisible;
  var imag;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


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
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton.extended(
                    heroTag: null,
                    label: Text('О приложении'),
                    foregroundColor:  Colors.white,// <-- Text
                    backgroundColor: const Color(0xFFC71A4F),
                    icon: Icon( // <-- Icon
                      Icons.info_outlined,
                      size: 24.0,
                    ),
                    onPressed: () {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutApp()),);},
                  ),
                  SizedBox(
                    height: 160,
                    width: 400,
                    child: Stack(
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
                          child: Center(
                            child: AnimatedOpacity(
                              opacity: _isVisible ? 1.0 : 0.0,
                              duration: Duration(seconds: 1),
                              child: Text(
                                'Привет, ${_firebaseAuth.currentUser?.displayName}!\nДавай скорее играть', textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                        ),
                        Positioned(
                          top: 110,
                          child:
                          CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(_firebaseAuth.currentUser!.photoURL.toString())
                          ),),
                      ],
                    ),
                  ),

                  FloatingActionButton.extended(
                    heroTag: null,
                    label: Text('Выйти из аккаунта'),
                    foregroundColor:  Colors.white,// <-- Text
                    backgroundColor: const Color(0xFFC71A4F),
                    icon: Icon( // <-- Icon
                      Icons.exit_to_app,
                      size: 24.0,
                    ),
                    onPressed: () {
                      final FirebaseAuthService out= new FirebaseAuthService();
                      out.signOut();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const AuthWindow()), (Route<dynamic> route) => false);},
                  ),
                ]),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 180,
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
