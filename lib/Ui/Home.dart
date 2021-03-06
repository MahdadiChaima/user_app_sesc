import 'package:flutter/material.dart';
import 'package:user_app_sesc/DataBase/DatabaseHelper.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/ContainerAppBar.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/appBarwithiconMenu.dart';
import 'package:user_app_sesc/Ui/Drawer/DrawerScreen.dart';
import 'package:user_app_sesc/Ui/Quiz.dart';
import 'ConstantWidget/botton_home.dart';
import 'ConstantWidget/Color.dart';
import 'package:user_app_sesc/Ui/Courses.dart';

class Home  extends StatelessWidget {
 static String id = 'Home';
 getData()async{
   var data=await db.getData();
   print("data inside home $data");

  return data;


 }
  @override
  Widget build(BuildContext context) {


    GlobalKey <ScaffoldState> _scaffoldKey =GlobalKey<ScaffoldState>();

      Size size = MediaQuery
          .of(context)
          .size;
      return SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            child: drawer(),
          ),

          body: ListView(

            children: [

              appBarwithiconMenu(
                  "Home", ()=>_scaffoldKey.currentState.openDrawer()),

              SizedBox(height: size.width / 7,),
              Column(
                children: [

//one button
                  //pour eviter de beaucoup texte de button alors je le met d une classe qui s appele buutton_menu et puis juste je l appel et je la donne des propriete
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 5),
                    child: button_home(
                      //une fonction ndiro fiha win 7abin nro7o
                      ontap: ()async {
                        var data = await getData();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Quiz(
                                  data: data,
                                )));

                        DatabaseHelper.UpdateScore(6, 6);

                      },

                      nom_image: 'MenuQuiz.gif',
                    ),
                  ),

                  Text(
                      ' Quiz',
                      style: TextStyle(
                          fontSize: 24,
                          color: colorUser.darkBlue,
                          fontFamily: 'VarelaRound-Regular',
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center

                  ),
                  Padding(

                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 5),
                    child: button_home(
                      //une fonction ndiro fiha win 7abin nro7o
                      ontap: () {
                        Navigator.pushNamed(context, Courses.id);
                      },

                      nom_image: 'courses.gif',
                    ),
                  ),

                  Text(
                      ' Courses',
                      style: TextStyle(
                          fontSize: 24,
                          color: colorUser.darkBlue,
                          fontFamily: 'VarelaRound-Regular',
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center

                  ),

                ],
              ),

            ],
          ),
        ),
      );
    }  }




