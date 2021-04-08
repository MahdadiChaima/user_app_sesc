import 'package:flutter/material.dart';
class inputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(width: size.width,
        margin: EdgeInsets.only(left:size.width/30,right:size.width/30, ),child: TextField(


    ))
    ;
  }
}
