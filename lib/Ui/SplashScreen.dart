import 'package:flutter/material.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:user_app_sesc/Ui/SingIn.dart';
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(width: size.width, height: size.height,
          decoration: BoxDecoration(gradient:LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [colorUser.lightBlue, colorUser.darkBlue])),

        child:AnimatedSplashScreen(splash:Container(width: size.width, height: size.height,
            decoration: BoxDecoration(gradient:LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [colorUser.lightBlue, colorUser.darkBlue]))),  nextScreen: SingIn(),duration: 3000,)),
      ),
    );
  }
}
//lol