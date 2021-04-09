import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:flutter/material.dart';
class time extends StatelessWidget {
  int temp;
  time(this.temp);
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return    Container(height:size.height/5,width:size.height/5,child: Center(
      child: Stack(
        children: [

          Center(
            child: TweenAnimationBuilder(
                tween: Tween(begin: 1.0,end: 0.0),
                duration: Duration(seconds: 20),
                builder:(context,value,_)=>SizedBox(height:size.height/5,width:size.height/5,child:  CircularProgressIndicator(
                  value: value,
                  valueColor:AlwaysStoppedAnimation<Color>(Colors.white70),
                  backgroundColor: colorUser.pink,
                  strokeWidth: 10,
                ),)),
          ),Center(
            child: Icon(Icons.watch_later_outlined,
              color: colorUser.pink,size: size.height/20,),
          ),
  ]),
    ));
  }
}