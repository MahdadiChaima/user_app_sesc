import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:flutter/material.dart';
class bottom extends StatelessWidget {
  String text;

  bottom({@required this.label,@required this.ontap} );
  final Function ontap;
  final String label;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return GestureDetector(
  onTap: ontap,
      child: Container(margin: EdgeInsets.only(right:size.width/4,left: size.width/4 ),
        decoration: BoxDecoration(gradient:LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colorUser.lightBlue, colorUser.darkBlue]),
          borderRadius: BorderRadius.all(Radius.circular(20) ,
          ),
        ),
        width: size.width/3,
        height: size.height/18,
        child: Center(child: Text(label,style: TextStyle(color:Colors.white,fontWeight: FontWeight.w500,fontSize: size.width/24),),),
      ),
    );
  }
}