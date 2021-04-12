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
            containerAppBar("تسجيل"),
            SizedBox(height: size.width/7,),
            Container(margin: EdgeInsets.only(left:size.width/30 ),child:Directionality(
              textDirection: TextDirection.rtl,
              child: Text("الإسم و اللقب :",
                textAlign: TextAlign.right,
                style: TextStyle(color: colorUser.gray,fontSize: size.width/22,fontFamily: 'Tajawal-Regular'),),
            )),

            inputField(contrl: name),
            SizedBox(height: size.width/10 ,),
            Container(margin: EdgeInsets.only(left:size.width/30 ),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text("رقم التسجيل :",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: colorUser.gray,fontSize: size.width/22,fontFamily: 'Tajawal-Regular'),))),

            inputField(contrl:inscription_number),
            SizedBox(height: size.width/10 ,),
            Container(margin: EdgeInsets.only(left:size.width/30 ),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text("البريد الإلكتروني",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: colorUser.gray,fontSize: size.width/22,fontFamily: 'Tajawal-Regular'),))),

            inputField(contrl:email),
            SizedBox(height: size.width/10 ,),
            Container(margin: EdgeInsets.only(left:size.width/30 ),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text("كلمة السر:",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: colorUser.gray,fontSize: size.width/22,fontFamily: 'Tajawal-Regular'),))),

            inputField(contrl:password),
            SizedBox(height: size.width/5 ,),

           Expanded(
             child: bottom(

               label: 'تسجيل',
               ontap: () {
                 Navigator.pushNamed(context,Home.id);
               },
             ),
           ),
            SizedBox(height: size.width/25 ,),
            Container(margin: EdgeInsets.only(right:size.width/20 ),child:Column(mainAxisAlignment: MainAxisAlignment.center,children: [
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text("هل لديك حساب ؟",style: TextStyle(fontSize: size.width/25,color: colorUser.lightGray,fontFamily: 'Tajawal-Regular'),)),
              GestureDetector(onTap: ()=>Navigator.of(context).pushNamed( SingIn.id),
                child:Text("دخول",style: TextStyle(fontSize: size.width/24,color: colorUser.gray,fontFamily: 'Tajawal-Regular'),),),
            ],))

          ],
        ),
      ),
    );
  }
}
