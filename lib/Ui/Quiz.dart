import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Time.dart';
import 'package:user_app_sesc/Ui/score_success.dart';
import 'package:user_app_sesc/controller/Question.dart';
import 'package:user_app_sesc/Ui/Drawer/DrawerScreen.dart';

import 'ConstantWidget/functions.dart';
//mazal Ma3rftch kifah ndiir  nta3 kiykliki 3la ansower ywli ytbal giir lawn nta3ha
//3labalk yakhi ttlawn 2ijaba b rose w font color ywli blabyad
//mamb3d yro7 l next qstion
//Time hadi ay fonction wa7dha mdayrtha fi constnt widget w hiya li tt7akm fi wa9t 2ijaba w tani 3ndha paramatre temp
//3ndk temp ymathl wa9t Sou2al gadah yg3d
Color backgroundAnsawer=Colors.white,colorFont=colorUser.gray;
int temp=20;
Question quizbrain = Question();
String qst="what you want to do this year?",
    ans1="Study and travet ...",
    ans2="eat and Sleap ....",
    ans3="travel and travel .....";
bool correct=false;
String corr_answer ='Study and travet ...'; //from data base


//Map<String,bool> correction={'ans1':false,'ans2':false,'ans3':false};
//int qstnb = 0;



class Quiz extends StatefulWidget {
  static String id = 'Quiz';
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  void initState() {
    super.initState();
  //  correction.clear();
   // correction={'ans1':false,'ans2':false,'ans3':false};

  }
  GlobalKey <ScaffoldState> _scaffoldKey =GlobalKey<ScaffoldState>();
  int qstnb = 0;
  void checkAns(int ans) {
    int correct = quizbrain.getQstans();

    setState(() {
      if (quizbrain.isFinished() == true) {
        //boite de dialogue
        quizbrain.reset();
        Navigator.pushNamed(context, Score_Success.id);


      } else {
      if (correct == ans) {
        backgroundAnsawer=Colors.lightGreenAccent;
        colorFont=Colors.white;
      } else {
        backgroundAnsawer=Colors.pink;
        colorFont=Colors.white;
      }
      quizbrain.nextqst();
    }}
        );
//The user picked true.
}

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  SafeArea(child: Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child:drawer(),
      ),
      body:
      Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(gradient:LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colorUser.lightBlue, colorUser.darkBlue])),
        child:ListView(children: [Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
          Container(margin: EdgeInsets.only(right:size.width/30,top: size.width/30 ),
              alignment:Alignment.topRight,child:IconButton(
                  onPressed: ()=>_scaffoldKey.currentState.openDrawer(),icon:Icon(Icons.menu_outlined,size: size.width/10,color: Colors.white,))),
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
              child: Column(
                children: [
                SizedBox(height: size.width/16,),Container( width: size.width/1.3,
                  padding:EdgeInsets.all(size.width/19),decoration:BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20) ,
                      ),border: Border.all(color:colorUser.darkGray)),
                     child:Text(quizbrain.getQsttxt(),style: TextStyle(color: colorUser.darkGray,fontSize: size.width/20),)),
                SizedBox(height: size.width/16,),
                answer(
                  ans: quizbrain.getans1txt(),
                  ontap: (){

                    checkAns(1);
                },),
                answer(ans: quizbrain.getans2txt(),
               ontap: (){
                 checkAns(2);
               }),
                answer(ans: quizbrain.getans3txt(),
                  ontap: (){
                    checkAns(3);
                  }),
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