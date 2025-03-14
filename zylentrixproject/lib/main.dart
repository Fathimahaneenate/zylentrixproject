import 'package:flutter/material.dart';
import 'package:zylentrixproject/homepage.dart';
import 'package:zylentrixproject/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        fontFamily: "Quicksand",
        
      ),
      home: SplashScreen()
    );
  }
}

