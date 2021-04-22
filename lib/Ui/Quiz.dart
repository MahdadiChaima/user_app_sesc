

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:user_app_sesc/DataBase/DatabaseHelper.dart';

import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Time.dart';
import 'package:user_app_sesc/Ui/score.dart';
import 'package:user_app_sesc/Ui/score_fail.dart';
import 'package:user_app_sesc/Ui/score_success.dart';

import 'package:user_app_sesc/controller/Question.dart';
import 'package:user_app_sesc/Ui/Drawer/DrawerScreen.dart';
import 'package:user_app_sesc/model/model.dart';
DatabaseHelper db=new DatabaseHelper();

int temp=20;
Question quizbrain = Question();

class Quiz extends StatefulWidget {
  static String id = 'Quiz';
  final dynamic data;
  Quiz({this.data});
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String que;
  String opt1, opt2, opt3, opt4;
  int qNo = 0;
  int score = 0;
  int ans = 9;
  int selectedRadio = 5;
  int trueAnswer;
  void updateUI() {
    setState(() {
      if (widget.data == null) {
        que = 'Unable to retrieve question, please check your network.';
        opt1 = 'null';
        opt2 = 'null';
        opt3 = 'null';
        opt4 = 'null';
        return;
      }

      que = widget.data[qNo]['Question'].toString();
      print(que);
      opt1 = widget.data[qNo]['A1']
          .toString();
      opt2 = widget.data[qNo]['A2']
          .toString();
      opt3 = widget.data[qNo]['A3']
          .toString();

    });
  }
  void updateQues() {
    setState(() {
      if (qNo == widget.data.length - 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Score(
                 score: score,
                )));
        return;
      } else {
        qNo++;
      }
    });
  }
  void checkAnswer(int trueAnswer) {
    if (widget.data[qNo]['correct']
        .toString() ==
        'A$trueAnswer'){
      print(" correct data $qNo: ${widget.data[qNo]['correct']}");
      print("score inside chek qst :$score");
      score++;}
    else { Navigator.pushNamed(context, Score_Fail.id);
    }
  }

  GlobalKey <ScaffoldState> _scaffoldKey =GlobalKey<ScaffoldState>();
  int qstnb = 0;



  @override
  Widget build(BuildContext context) {
    updateUI();

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
                  SizedBox(height: size.width/16,),Container( width: size.width/1.15,
                      padding:EdgeInsets.all(size.width/25),decoration:BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20) ,
                          ),border: Border.all(color:colorUser.darkGray)),
                      child:Text(que,textAlign:TextAlign.center,style: TextStyle(color: colorUser.darkGray,fontSize: size.width/20,fontFamily: 'Tajawal-Regular'),)),
                  SizedBox(height: size.width/16,),

                  answer(
                    ans: opt1,

                    ontap: (){

                      checkAnswer(1);
                      setState(() {
                        time(temp);
                        updateQues();
                      });


                    },
                  ),

                  answer(ans: opt2,
                      ontap: (){
                        checkAnswer(2);
                        setState(() {updateQues();
                        time(temp);
                        });
                      }
                  ),

                  answer(ans: opt3,
                      ontap: (){checkAnswer(3);
                        //checkAns(3);
                        setState(() {

                          updateQues();
                          time(temp);
                        });
                      }
                  ),
                ],),
            ),
          )
        ],),
      ),

    ),);
  }
}


class answer extends StatelessWidget {
  answer({ @required this.ans, @required this.ontap  //this.ontap
  });

  final String ans;
  final Function ontap;
  //final Function ontap;

  @override
  Widget build(BuildContext context) { Size size=MediaQuery.of(context).size;

  return GestureDetector(
    //  la methode onTap sert a fait action listener
    onTap: ontap,

    child:
    Container(  padding:EdgeInsets.only(top:size.width/22,left:size.width/30 ,right:size.width/30 ,bottom:size.width/22 ),
      width:size.width,
      decoration: BoxDecoration(color:Colors.white,border: Border.all(color:colorUser.lightGray)),
      margin: EdgeInsets.all(size.width/25),


      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Text(ans,textAlign:TextAlign.center,style: TextStyle(color:colorUser.gray,fontSize: size.width/22,fontFamily: 'Tajawal-Regular'),)),
    ),

  );

  }
}
