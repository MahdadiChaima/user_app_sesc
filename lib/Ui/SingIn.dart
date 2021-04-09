import 'package:flutter/material.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/ContainerAppBar.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/inputField.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Bottom.dart';
import 'package:user_app_sesc/Ui/Home.dart';
import 'package:user_app_sesc/Ui/Sing%20Up.dart';
import 'package:user_app_sesc/Ui/forgetPassword.dart';
final TextEditingController email = new TextEditingController();
final TextEditingController password = new TextEditingController();

class SingIn extends StatelessWidget {

  static String id = 'Signin';
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(

          children: [
            containerAppBar("Sing In"),
         SizedBox(height: size.width/5,),
        Container(margin: EdgeInsets.only(left:size.width/20 ),alignment:Alignment.topLeft,child:Text("Email:",style: TextStyle(color: colorUser.gray,fontSize: size.width/20),)),

            inputField(contrl:email),

            SizedBox(height: size.width/10 ,),
            Container(margin: EdgeInsets.only(left:size.width/20 ),alignment:Alignment.topLeft,child: Text("Password:",style: TextStyle(color: colorUser.gray,fontSize: size.width/20),)),

            inputField(contrl:password),
            SizedBox(height: size.width/25 ,),
            GestureDetector(child:Container(margin: EdgeInsets.only(right:size.width/30 ),alignment:Alignment.topRight,child:GestureDetector(onTap: ()=>Navigator.of(context).pushNamed( forgetPassword.id),
                child: Text("Forget password?",style: TextStyle(fontWeight:FontWeight.w400,color: colorUser.darkBlue,fontSize: size.width/26),)),)),
            SizedBox(height: size.width/3 ,),

            bottom(
              label: 'Sign in',
              ontap: () {
                Navigator.pushNamed(context,Home.id);
              },
            ),
            SizedBox(height: size.width/25 ,),
            Container(margin: EdgeInsets.only(right:size.width/20 ),child:Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Text("Dont have an account?",style: TextStyle(fontSize: size.width/25,color: colorUser.lightGray),),
              GestureDetector(onTap: ()=>Navigator.of(context).pushNamed( SingUp.id),child:Text("Sing Up",style: TextStyle(fontSize: size.width/24,color: colorUser.gray),),),
            ],))

          ],
        ),
      ),
    );
  }
}
