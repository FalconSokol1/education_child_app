import 'package:education_child_app/authWindow.dart';
import 'package:education_child_app/mainPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
      options: FirebaseOptions(apiKey: "AIzaSyDOXy2e0ZSVOdT_QzTDvcCMtfHfgUf_SLo", appId: '1:904791746477:android:8a26e9f5f73908574a2324',
          messagingSenderId: "904791746477", projectId: "childapp-daeea"));
  User? currentUser = FirebaseAuth.instance.currentUser;
  Widget initialWidget;
  if (currentUser != null) {
    initialWidget = HomePage();
  } else {
    initialWidget = AuthWindow();
  }

  runApp(MyApp(initialWidget: initialWidget));
}

class MyApp extends StatelessWidget {
  final Widget initialWidget;
  const MyApp({required this.initialWidget});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: initialWidget,
    );
  }
}