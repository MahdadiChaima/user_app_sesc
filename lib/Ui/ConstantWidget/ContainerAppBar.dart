import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class containerAppBar extends StatelessWidget {
  String text;
  containerAppBar(this.text);
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(gradient:LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colorUser.lightBlue, colorUser.darkBlue]),
        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(135) ,bottomRight:Radius.circular(135) ,
        ),
      ),
      width: size.width,
      height: size.height/8,
     child: Center(child: Text(this.text,style: GoogleFonts.mcLaren(color:Colors.white,fontWeight: FontWeight.bold,fontSize: size.width/18),),),
    );
  }
}
