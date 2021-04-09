import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Courses extends StatelessWidget {
  static String id = 'courses';

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(

          children: [
            Container(
              decoration: BoxDecoration(

                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(45) ,bottomRight:Radius.circular(135) ,
                ),
              ),

              child:  ClipRRect(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(72.0),top: Radius.circular(0)),
                  child: Image.asset("assest/courses.gif")),
            ),
            SizedBox(height: size.width/7,),

//cm
          ],
        ),
      ),
    );
  }
}
