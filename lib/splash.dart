import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:page_transition/page_transition.dart';

import 'package:untitled/home.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 500,
      nextScreen: Home(),
      backgroundColor: Colors.deepPurpleAccent,
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.bottomToTop,

      splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: Icon(
                size: 90,
                Icons.note_alt_outlined,
                color: Colors.deepPurpleAccent,

              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,

              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Notee",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)])

    );
  }
}


