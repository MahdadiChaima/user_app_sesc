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

                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(135) ,bottomRight:Radius.circular(135) ,
                ),
              ),
              width: size.width,
              height: size.height/8,
              child:  Image.asset("assest/courses.gif",width: size.width,height: size.width,),
            ),
            SizedBox(height: size.width/7,),


          ],
        ),
      ),
    );
  }
}
