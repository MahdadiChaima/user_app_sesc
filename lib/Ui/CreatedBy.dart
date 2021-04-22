import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:user_app_sesc/Ui/Drawer/DrawerScreen.dart';
import 'package:user_app_sesc/Ui/Drawer/DrawerScreen.dart';
import 'package:user_app_sesc/Ui/Home.dart';
import 'package:animated_text_kit/animated_text_kit.dart';



class CreatedBy extends StatelessWidget {
  static String id = 'CreatedBy';

  @override
  Widget build(BuildContext context) {
    GlobalKey <ScaffoldState> _scaffoldKey =GlobalKey<ScaffoldState>();
    Size size=MediaQuery.of(context).size;

    const colorizeColors = [
      Colors.black,
      colorUser.lightBlue,
      colorUser.darkBlue,
      //colorUser.pink,
      colorUser.lightGray
      //Colors.lightGreenAccent,
    ];

   var colorizeTextStyle = TextStyle(
        fontSize:size.width/10,
        fontFamily:'OleoScript-Bold'
    );
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child:drawer(),
        ),
        body: ListView(

          children: [
            Stack(children: [ Container(width: size.width,height: size.width/1.2,
              decoration: BoxDecoration(image:DecorationImage(image: AssetImage("assest/MemberSescClub.PNG"),fit: BoxFit.cover,),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(60) ,bottomLeft: Radius.circular(60) ,
                  ),boxShadow: [BoxShadow(
                    offset: Offset(1,0),
                    color: colorUser.darkGray,blurRadius: 14,)]),),
              Container(margin: EdgeInsets.only(right:size.width/30,top: size.width/30 ),alignment:Alignment.topLeft
                  ,child:IconButton(onPressed:  ()=>_scaffoldKey.currentState.openDrawer(),
                      icon:Icon(Icons.menu_outlined,size: size.width/10,color: Colors.white,))),
              Container(margin: EdgeInsets.only(left:size.width/30,top: size.width/30 ),alignment:Alignment.topRight,
                  child:IconButton(onPressed: ()=>{Navigator.pushNamed(context,Home.id)},icon:
                  Icon(Icons.home_filled,size: size.width/10,color: Colors.white,))),],),


            //  SizedBox(height: size.width/5,),
            //   Center(child: Text("in progress...",style: TextStyle(fontSize: size.width/10,color:colorUser.darkGray),)),
            //  SizedBox(height: size.width/5,),
            //   Center(child: Text("in progress...",style: TextStyle(fontSize: size.width/10,color:colorUser.darkGray),)),


            SizedBox(height: size.width/5,),
            Center(

              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Created By: ',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),

                ],
                isRepeatingAnimation: true,
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),

            SizedBox(height: size.width/17,),
           Center(child:Text(
             "Setifian scintific club"
            ,style: TextStyle(fontSize: size.width/16,color:colorUser.darkGray,fontFamily:'OleoScript-Bold')
           )),


//cm
          ],
        ),
      ),
    );
  }
}
