import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:user_app_sesc/Ui/Drawer/DrawerScreen.dart';
import 'package:user_app_sesc/Ui/Home.dart';
int score=20,totalscore=100;

class Score_Success extends StatelessWidget {
  static String id = 'Score_Success';

  @override
  Widget build(BuildContext context) {
  GlobalKey <ScaffoldState> _scaffoldKey =GlobalKey<ScaffoldState>();

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
              decoration: BoxDecoration(image:DecorationImage(image: AssetImage("assest/success.PNG"),fit: BoxFit.cover,),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(60) ,bottomLeft: Radius.circular(60) ,
                  ),boxShadow: [BoxShadow(
                    offset: Offset(1,0),
                    color: colorUser.darkGray,blurRadius: 14,)]),),
        Container(margin: EdgeInsets.only(right:size.width/30,top: size.width/30 ),alignment:Alignment.topRight,
            child:IconButton(onPressed: ()=>{Navigator.pushNamed(context,Home.id)},icon:Icon(Icons.home_filled,
              size: size.width/10,color:colorUser.gray,))),

        Container(margin: EdgeInsets.only(left:size.width/30,top: size.width/30 ),alignment:Alignment.topLeft,
            child:IconButton(onPressed: ()=>_scaffoldKey.currentState.openDrawer(),icon:Icon(Icons.menu_outlined,
              size: size.width/10,color:colorUser.gray,))),
]),
        SizedBox(height: size.width/5,),
            Center(child: Text("You Win",style: TextStyle(fontSize: size.width/7,color:colorUser.darkGray),)),
            Center(child: Text("$totalscore/$totalscore",style: TextStyle(fontSize: size.width/10,color:colorUser.orange,fontFamily: 'VarelaRound-Regular'),))



         ]),   floatingActionButton: FloatingActionButton(onPressed: (){Navigator.pop(context);},child: Icon(Icons.arrow_back_ios_outlined),
        backgroundColor: colorUser.orange,  ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat
      ),
    );
  }
 /* Widget build(BuildContext context) {
      Size size=MediaQuery.of(context).size;
    Alert(
      context: context,
      title: "You Win",
      desc: "$totalscore/$totalscore",
     style: AlertStyle(descStyle: TextStyle(fontSize: size.width/10,color:colorUser.orange)),
      image: Image.asset("assest/success.PNG"),
        buttons: [
          DialogButton(

            onPressed: () {
              Navigator.pop(context);
              // TODO: change password
            } ,

            child: Text(
              "Save",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]
    ).show();*/
  }



