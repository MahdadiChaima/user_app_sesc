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
            containerAppBar("دخول"),
         SizedBox(height: size.width/5,),
        Container(margin: EdgeInsets.only(left:size.width/20 ),
            child:Directionality(
                textDirection: TextDirection.rtl,
                child: Text("البريد الإلكتروني :",textAlign: TextAlign.start,
                  style: TextStyle(color: colorUser.gray,fontSize: size.width/20,fontFamily: 'Tajawal-Regular'),))),

            inputField(contrl:email),

            SizedBox(height: size.width/10 ,),
            Container(margin: EdgeInsets.only(left:size.width/20 ),
                child: Directionality(
                    textDirection: TextDirection.rtl,child: Text("كلمة السر :",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: colorUser.gray,fontSize: size.width/20,fontFamily: 'Tajawal-Regular'),))),

            inputField(contrl:password),
            SizedBox(height: size.height/15 ,),
            GestureDetector(child:Container(margin: EdgeInsets.only(right:size.width/30 ),
              alignment:Alignment.topLeft,
              child:GestureDetector(onTap: ()=>Navigator.of(context).pushNamed( forgetPassword.id),
                child: Text("هل نسيت كلمة السر ؟",
                  style: TextStyle(
                      fontWeight:FontWeight.w400,
                      color: colorUser.darkBlue,
                      fontSize: size.width/26,
                      fontFamily: 'Tajawal-Regular'),)),)),
            SizedBox(height: size.width/3 ,),

            bottom(
              label: 'دخول',
              ontap: () {
                Navigator.pushNamed(context,Home.id);
              },
            ),
            SizedBox(height: size.height/25 ,),
            Container(
                margin: EdgeInsets.only(right:size.width/20 ),
                child:Column(mainAxisAlignment: MainAxisAlignment.center,children: [
              Directionality(textDirection: TextDirection.rtl,
                  child: Text("ليس لديك حساب ؟",style: TextStyle(fontSize: size.width/25,color: colorUser.lightGray,fontFamily: 'Tajawal-Regular'),)),
              SizedBox(height: size.height/30 ,),
              GestureDetector(onTap: ()=>Navigator.of(context).pushNamed( SingUp.id),
                child:Directionality(textDirection: TextDirection.rtl,
                    child: Text("تسجيل",style: TextStyle(fontSize: size.width/24,color: colorUser.gray,fontFamily: 'Tajawal-Regular'),)),),
            ],))

          ],
        ),
      ),
    );
  }
}
