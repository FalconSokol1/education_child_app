import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_child_app/mainPage.dart';
import 'package:education_child_app/numberWindow.dart';
import 'package:education_child_app/wordWindow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'authService.dart';

class AuthWindow extends StatefulWidget {
  const AuthWindow({Key? key});

  @override
  State<AuthWindow> createState() => _AuthWindowState();
}

class _AuthWindowState extends State<AuthWindow> {
  late bool _isVisible;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;



  @override
  void initState() {
    super.initState();
    _isVisible = false;

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
      body: Center(child:
      Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 400,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 140,
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
                          'Войди с помощью Google', textAlign: TextAlign.center,
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
                    bottom: 170,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/logoChildApp.jpeg'),
                    ),
                  ),

                ],
              ),
            ),
            FloatingActionButton.extended(
              heroTag: null,
              label: Text('Войти'),
              foregroundColor:  Colors.white,// <-- Text
              backgroundColor: const Color(0xFFC71A4F),
              icon:  Image.asset(
                  'assets/google.png',
                  fit:BoxFit.cover,
                  height: 40, width: 40
              ),
                onPressed: () {
                _signInWithGoogle();
                _createUser();
              },
            ),
          ],
        ),
      ),)
    );
  }
  _signInWithGoogle()async{

    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {

      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if(googleSignInAccount != null){
        final GoogleSignInAuthentication googleSignInAuthentication = await
        googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()),);


      }


    }catch(e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("some error occured $e")));
      print(e);
    }


  }
  Future _createUser()async{
    bool newPlayer = false;

    var isUserReal = await FirebaseFirestore.instance.collection('Users').doc(_firebaseAuth.currentUser!.email).get();
    if(!isUserReal.exists){
      final docUser = FirebaseFirestore.instance.collection('Users').doc('${_firebaseAuth.currentUser!.email}');
      final user = {
        'Id':_firebaseAuth.currentUser!.email,
        'Name': _firebaseAuth.currentUser!.displayName,
        'NewPlayer': newPlayer=true,
        'NewPlayerNumber': newPlayer,
        'NewPlayerWord': newPlayer,
      };
      await docUser.set(user);
    }
    if(isUserReal.exists){

    }

  }
}