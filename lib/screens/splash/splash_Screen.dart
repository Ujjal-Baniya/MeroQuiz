import 'package:flutter/material.dart';
import 'package:meroquiz/configs/themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: mainGradient(context),
          ),
          child: Image.asset(
              width: 200, height: 200, "assets/images/app_splash_logo.png")),
    );
  }
}
