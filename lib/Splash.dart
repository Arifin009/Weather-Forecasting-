import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'UI/Home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/Animation_splash.json',
          width: 200, // Adjust width as needed
          height: 200, // Adjust height as needed
          repeat: true, // Set to true for loop animation
          reverse: false, // Set to true to play the animation in reverse
        ),
      ),
    );
  }

  _navigatetohome() async {
    Future.delayed(Duration(seconds: 2), () {
      // Navigator.push replaces the current screen with the new one
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    });
  }
}
