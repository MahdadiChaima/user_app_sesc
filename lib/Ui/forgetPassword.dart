import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
class forgetPassword extends StatelessWidget {
  static String id = 'forgetpassword';
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      body:ListView(
        children: [
          Image.asset("assest/forgetPassword.png",width: size.width,height: size.width,),
          Center(child:Text("Forget Password",style: TextStyle(color: colorUser.darkGray,fontSize: size.width/15),),),
      Center(child:Container(padding: EdgeInsets.all(size.width/30),width: size.width,height: size.height/2,child: Text("Enter email associated with your account well send your fartherinstruction",style: TextStyle(
            color: colorUser.lightGray,fontSize: size.width/18
          ),)),)
        ],
      ),
    ));
  }
}
