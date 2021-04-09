import 'package:flutter/material.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:user_app_sesc/Ui/Courses.dart';
import 'package:user_app_sesc/Ui/account.dart';
import 'package:user_app_sesc/Ui/score.dart';
class drawer extends StatelessWidget {
  static String id = 'drawer';

  @override
  Widget build(BuildContext context) { Size size=MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      body: ListView(children: [
     Container(
      decoration: BoxDecoration(gradient:LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [colorUser.lightBlue, colorUser.darkBlue]),
      borderRadius: BorderRadius.only(bottomLeft:Radius.circular(135) ,bottomRight:Radius.circular(135) ,
      ),
      ),
      width: size.width,
      height: size.height/8,
      child:Stack(children: [Center(child: Text("Menu",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: size.width/18),),),
      Container(margin: EdgeInsets.only(left:size.width/10,top: size.width/26 ),alignment:Alignment.topLeft,child:IconButton(onPressed: ()=>{Navigator.pop(context)},icon:Icon(Icons.arrow_back_ios_outlined,size: size.width/12,color: Colors.white,))),


        ],),

     ), SizedBox(height: size.width/6,),
        ListMenu(icon: Icons.account_circle,text: "Account",tap:()=>Navigator.pushNamed(context,account.id)),
        ListMenu(icon: Icons.poll,text: "Score",tap: ()=>{Navigator.pushNamed(context,Score.id)},),
        ListMenu(icon: Icons.menu_book,text: "Courses",tap: ()=>Navigator.pushNamed(context,Courses.id),),
        ListMenu(icon: Icons.star,text: "grade",tap: ()=>{},),
        ListMenu(icon: Icons.help,text: "Aide",tap: ()=>{},),
        ListMenu(icon: Icons.share,text: "Shared",tap: ()=>{},),
        ListMenu(icon: Icons.people_rounded,text: "Created By",tap: ()=>{},),

      ])
    ));
  }
}


class ListMenu extends StatelessWidget {

  String text;
  IconData icon;
  Function tap;
  ListMenu({this.icon, this.text, this.tap});
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left:size.width/5,top: size.width/12),
      child: GestureDetector(
        onTap: tap,
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size:size.width/16,
              color: colorUser.darkBlue,
            ),
            SizedBox(
              width: size.width/30,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize:size.width/16 ,
                color: colorUser.gray,
                   ),
            ),
          ],
        ),
      ),
    );
  }
}

