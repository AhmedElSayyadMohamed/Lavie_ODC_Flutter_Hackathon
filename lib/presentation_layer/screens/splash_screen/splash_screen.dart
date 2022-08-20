// ignore_for_file: unnecessary_null_comparison

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lavie/presentation_layer/layout/layout.dart';
import 'package:lavie/presentation_layer/screens/AutinticationScreen/autintication_screen.dart';
import 'package:lavie/presentation_layer/shared/resources/assets_manger.dart';
import '../../shared/constant/constant.dart';

// ignore: use_key_in_widget_constructors
class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body:  AnimatedSplashScreen(
      splash:AssetsManager.appLogo,
      nextScreen: token!=null?LayoutScreen():AuthenticationScreen(),
      splashTransition: SplashTransition.slideTransition,
    ),
    );
  }
}
