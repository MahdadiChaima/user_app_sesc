import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:user_app_sesc/Ui/Drawer/DrawerScreen.dart';
import 'package:user_app_sesc/Ui/Home.dart';
int totalscore=100;

class Score extends StatelessWidget {
  int score;
  Score({this.score});
  GlobalKey <ScaffoldState> _scaffoldKey =GlobalKey<ScaffoldState>();

  static String id = 'Score';

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            child:drawer(),
          ),
        body: ListView(

          children: [
            Stack(children: [ Container(width: size.width,height: size.width/1.2,
              decoration: BoxDecoration(image:DecorationImage(image: AssetImage("assest/howScore.jpg"),fit: BoxFit.cover,),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(60) ,bottomLeft: Radius.circular(60) ,
                  ),boxShadow: [BoxShadow(
                    offset: Offset(1,0),
                    color: colorUser.darkGray,blurRadius: 14,)]),),
        Container(margin: EdgeInsets.only(right:size.width/30,top: size.width/30 ),alignment:Alignment.topRight,
            child:IconButton(onPressed: ()=>{Navigator.pushNamed(context,Home.id)},icon:Icon(Icons.home_filled,
              size: size.width/10,color:colorUser.lightGray,))),

        Container(margin: EdgeInsets.only(left:size.width/30,top: size.width/30 ),alignment:Alignment.topLeft,
            child:IconButton(onPressed: ()=>_scaffoldKey.currentState.openDrawer(),icon:Icon(Icons.menu_outlined,
              size: size.width/10,color:colorUser.lightGray,))),
]),
        SizedBox(height: size.width/5,),
            Center(child: Text("Your Score is:",style: TextStyle(fontSize: size.width/10,color:colorUser.darkGray,fontFamily: 'VarelaRound-Regular'),)),
            Center(child: Text("$score/$totalscore",style: TextStyle(fontSize: size.width/10,color:colorUser.orange,fontFamily: 'VarelaRound-Regular'),))



          ]),
      
      ),

    );
  }
}
