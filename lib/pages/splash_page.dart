import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app/pages/bottom_navegation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Image.asset('assets/images/logo-mybuy.png'),
        splashIconSize: 500,
        duration: 2500,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Color(0xFF3da8a2),
        nextScreen: BottonNavigation());
  }
}
