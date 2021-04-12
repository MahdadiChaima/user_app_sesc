import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Bottom.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/inputField.dart';
import 'package:user_app_sesc/Ui/Home.dart';
class forgetPassword extends StatelessWidget {
  final TextEditingController email = new TextEditingController();

  static String id = 'forgetpassword';
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      body:ListView(
        children: [
      Container(width: size.width,height: size.width/1.2,
      decoration: BoxDecoration(image:DecorationImage(image: AssetImage("assest/forgetPassword.png"),fit: BoxFit.cover,),
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(60) ,bottomLeft: Radius.circular(60) ,
        ),boxShadow: [BoxShadow(
          offset: Offset(1,0),
            color: colorUser.darkGray,blurRadius: 4,
          )]
      ),

      ),
          SizedBox(height:size.width/20 ,),
          textcenter(text: "نسيت كلمة السر",size: size.width/15,color: colorUser.darkGray,),
          SizedBox(height:size.width/20 ,),
          textcenter(text: "ادخل اليمايل الموافق",size: size.width/20,color: colorUser.lightGray,),
          textcenter(text: "سنرسل لك رسالة",size: size.width/20,color: colorUser.lightGray,),
          textcenter(text: "instruction",size: size.width/20,color: colorUser.lightGray,),
          SizedBox(height:size.width/20 ,),
       inputField(contrl: email,),

          SizedBox(height:size.width/7 ,),

       bottom(label: "إرسال", ontap: ()=>Navigator.pushNamed(context, Home.id))
        ],
      ),
    ));
  }
}

class textcenter extends StatelessWidget {
  const textcenter({
    Key key,
    @required this.size,@required this.color,@required this.text,
  }) : super(key: key);

  final double size;
  final Color color;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Center(child:Text(text,style: TextStyle(color:color,fontSize:size,fontFamily: 'Tajawal-Regular'),),);
  }
}
