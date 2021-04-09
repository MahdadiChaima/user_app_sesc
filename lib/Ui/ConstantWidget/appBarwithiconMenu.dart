import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:flutter/material.dart';
import 'package:user_app_sesc/Ui/Drawer/DrawerScreen.dart';
import 'package:user_app_sesc/Ui/Home.dart';
class appBarwithiconMenu extends StatelessWidget {
  String text;
  appBarwithiconMenu(this.text);
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
      child:Stack(children: [Center(child: Text(this.text,style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: size.width/18),),),
        Container(margin: EdgeInsets.only(right:size.width/10,top: size.width/28 ),alignment:Alignment.topRight,child:IconButton(onPressed: ()=>{Navigator.pushNamed(context,drawer.id)},icon:Icon(Icons.menu_outlined,size: size.width/10,color: Colors.white,))),
      ],),
          );
  }
}
