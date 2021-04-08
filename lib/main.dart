import 'package:flutter/material.dart';
import 'package:user_app_sesc/Ui/Sing%20Up.dart';
import 'package:user_app_sesc/Ui/SingIn.dart';
import 'package:user_app_sesc/Ui/forgetPassword.dart';
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

    },));
}
