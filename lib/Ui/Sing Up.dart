import 'package:flutter/material.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/ContainerAppBar.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/inputField.dart';
import 'package:user_app_sesc/Ui/Home.dart';
import 'package:user_app_sesc/Ui/SingIn.dart';
import 'ConstantWidget/Bottom.dart';
final TextEditingController name = new TextEditingController();
final TextEditingController inscription_number = new TextEditingController();
final TextEditingController email = new TextEditingController();
final TextEditingController password = new TextEditingController();

class SingUp extends StatelessWidget {

  static String id = 'signup';
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(

          children: [
            containerAppBar("Sing Up"),
            SizedBox(height: size.width/7,),
            Container(margin: EdgeInsets.only(left:size.width/30 ),alignment:Alignment.topLeft,child:Text("First and last name:",style: TextStyle(color: colorUser.gray,fontSize: size.width/22),)),

            inputField(contrl: name),
            SizedBox(height: size.width/10 ,),
            Container(margin: EdgeInsets.only(left:size.width/30 ),alignment:Alignment.topLeft,child: Text("Insccription Number:",style: TextStyle(color: colorUser.gray,fontSize: size.width/22),)),

            inputField(contrl:inscription_number),
            SizedBox(height: size.width/10 ,),
            Container(margin: EdgeInsets.only(left:size.width/30 ),alignment:Alignment.topLeft,child: Text("Email:",style: TextStyle(color: colorUser.gray,fontSize: size.width/22),)),

            inputField(contrl:email),
            SizedBox(height: size.width/10 ,),
            Container(margin: EdgeInsets.only(left:size.width/30 ),alignment:Alignment.topLeft,child: Text("Password:",style: TextStyle(color: colorUser.gray,fontSize: size.width/22),)),

            inputField(contrl:password),
            SizedBox(height: size.width/5 ,),

           Expanded(
             child: bottom(

               label: 'Sign up',
               ontap: () {
                 Navigator.pushNamed(context,Home.id);
               },
             ),
           ),
            SizedBox(height: size.width/25 ,),
            Container(margin: EdgeInsets.only(right:size.width/20 ),child:Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Text("Already have an account?",style: TextStyle(fontSize: size.width/25,color: colorUser.lightGray),),
              GestureDetector(onTap: ()=>Navigator.of(context).pushNamed( SingIn.id),child:Text("Sing In",style: TextStyle(fontSize: size.width/24,color: colorUser.gray),),),
            ],))

          ],
        ),
      ),
    );
  }
}
