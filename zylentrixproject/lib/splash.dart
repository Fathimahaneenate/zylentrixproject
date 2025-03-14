
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zylentrixproject/homepage.dart';
import 'colorwidget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  int colorIndex = 0; // Variable to keep track of the current color index
  late Timer _timer; // Timer to change colors periodically
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        colorIndex = (colorIndex + 1) % RainbowColors.rainbowColors.length;
      });
    });
    // Delayed navigation 
    Future.delayed(Duration(seconds: 3), () {
      _timer.cancel(); 
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PostListScreen()),
      );
    });
  }
  @override
  void dispose() {
    _timer.cancel(); // Ensure the timer is canceled when the widget is disposed
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: RainbowColors.rainbowColors[colorIndex],
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Dynamically adjust text size based on screen width
            double fontSize = screenWidth * 0.08; 
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Unleash the Power of Words..',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22, 
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 130, 86, 137),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
