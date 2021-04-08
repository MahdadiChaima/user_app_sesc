import 'package:flutter/material.dart';
import 'package:user_app_sesc/Ui/Sing%20Up.dart';
import 'package:user_app_sesc/Ui/SingIn.dart';
import 'package:user_app_sesc/Ui/forgetPassword.dart';
import 'Ui/Home.dart';
import 'Ui/SplashScreen.dart';

void main() {
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

    routes: {
      'SplashScreen': (context) => SplashScreen(),
      'Sing In': (context) => SingIn(),
      'Sing Up': (context) => SingUp(),
      'forget Password': (context) => forgetPassword(),
      'Home': (context) => Home(),

    },));
}
