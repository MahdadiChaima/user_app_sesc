import 'package:flutter/material.dart';
import 'package:user_app_sesc/Ui/Drawer/DrawerScreen.dart';
import 'package:user_app_sesc/Ui/Quiz.dart';
import 'package:user_app_sesc/Ui/Sing%20Up.dart';
import 'package:user_app_sesc/Ui/SingIn.dart';
import 'package:user_app_sesc/Ui/account.dart';
import 'package:user_app_sesc/Ui/forgetPassword.dart';
import 'package:user_app_sesc/Ui/score.dart';
import 'package:user_app_sesc/Ui/score_fail.dart';
import 'package:user_app_sesc/Ui/score_success.dart';
import 'Ui/Home.dart';
import 'Ui/Courses.dart';

import 'Ui/SplashScreen.dart';

void main() {
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

    routes: {
      SplashScreen.id: (context) => SplashScreen(),
      SingIn.id: (context) => SingIn(),
      SingUp.id: (context) => SingUp(),
      forgetPassword.id: (context) => forgetPassword(),
      Home.id: (context) => Home(),
      Courses.id: (context) => Courses(),
      drawer.id:(context)=>drawer(),
      Quiz.id:(context)=>Quiz(),
      Score.id:(context)=>Score(),
      Score_Fail.id:(context)=>Score_Fail(),
      Score_Success.id:(context)=>Score_Success(),
      account.id:(context)=>account(),

    },));
}
