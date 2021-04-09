import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Time.dart';
import 'package:user_app_sesc/Ui/Home.dart';
import 'package:user_app_sesc/Ui/Drawer/DrawerScreen.dart';
//mazal Ma3rftch kifah ndiir  nta3 kiykliki 3la ansower ywli ytbal giir lawn nta3ha
//3labalk yakhi ttlawn 2ijaba b rose w font color ywli blabyad
//mamb3d yro7 l next qstion
//Time hadi ay fonction wa7dha mdayrtha fi constnt widget w hiya li tt7akm fi wa9t 2ijaba w tani 3ndha paramatre temp
//3ndk temp ymathl wa9t Sou2al gadah yg3d
Color backgroundAnsawer=Colors.white,colorFont=colorUser.gray;
int temp=20;
String qst="what you want to do this year?",ans1="Study and travet ...",ans2="eat and Sleap ....",ans3="travel and travel .....";
class Quiz extends StatefulWidget {
  static String id = 'Quiz';
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  SafeArea(child: Scaffold(
      body:
      Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(gradient:LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colorUser.lightBlue, colorUser.darkBlue])),
        child:ListView(children: [Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [  Container(margin: EdgeInsets.only(left:size.width/30,top: size.width/30 ),alignment:Alignment.topLeft,child:IconButton(onPressed: ()=>{Navigator.pushNamed(context,Home.id)},icon:Icon(Icons.home_filled,size: size.width/10,color: Colors.white,)),), Container(margin: EdgeInsets.only(right:size.width/30,top: size.width/30 ),alignment:Alignment.topRight,child:IconButton(onPressed: ()=>{Navigator.pushNamed(context,drawer.id)},icon:Icon(Icons.menu_outlined,size: size.width/10,color: Colors.white,))),
        ],),

          time(temp),
          SizedBox(height: size.width/10,),
          Container(

            width: size.width,
            height: size.height/1.5,
            decoration: BoxDecoration(color:Colors.white,
              borderRadius: BorderRadius.only(topLeft:Radius.circular(68) ,topRight:Radius.circular(68) ,
              ),
            ),
            child: Center(
              child: Column(children: [SizedBox(height: size.width/16,),Container( width: size.width/1.3,
                  padding:EdgeInsets.all(size.width/19),decoration:BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20) ,
                      ),border: Border.all(color:colorUser.darkGray)), child:Text(qst,style: TextStyle(color: colorUser.darkGray,fontSize: size.width/20),)),
                SizedBox(height: size.width/16,),
                answer(ans: ans1,ontap: (){
                  setState(() {
                    backgroundAnsawer=colorUser.pink;
                    colorFont=Colors.white;
                  });
                  Navigator.pushNamed(context, Quiz.id);



                },),
                answer(ans: ans2,ontap: ()=>{},),
                answer(ans: ans3,ontap: ()=>{},),
              ],),
            ),
          )
        ],),
      ),

    ),);
  }
}


class answer extends StatelessWidget {
  answer({@required this.ans, @required this.ontap});

  final String ans;

  final Function ontap;

  @override
  Widget build(BuildContext context) { Size size=MediaQuery.of(context).size;
    return GestureDetector(
      //la methode onTap sert a fait action listener
      onTap: ontap,
      child: Container(  padding:EdgeInsets.only(top:size.width/22,left:size.width/30 ,right:size.width/30 ,bottom:size.width/22 ),
        width:size.width,
         decoration: BoxDecoration(color:backgroundAnsawer,border: Border.all(color:colorUser.lightGray)),
       margin: EdgeInsets.all(size.width/25),


        child: Text(ans,style: TextStyle(color:colorFont,fontSize: size.width/22),),
      ),
    );
  }
}