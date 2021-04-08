import 'package:flutter/material.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/ContainerAppBar.dart';
import 'ConstantWidget/botton_home.dart';
import 'ConstantWidget/Color.dart';
class Home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(

          children: [
            containerAppBar("Home"),
            SizedBox(height: size.width/7,),
            Column(
              children: [


                  //pour eviter de beaucoup texte de button alors je le met d une classe qui s appele buutton_menu et puis juste je l appel et je la donne des propriete
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal:70 ,vertical:5 ),
                 child: button_home(
                      //une fonction ndiro fiha win 7abin nro7o
                      ontap: () {
                        //Navigator.pushNamed(context, quizz);
                      },

                      nom_image: 'MenuQuiz.gif',
                    ),
               ),

                Text(
                      ' Quiz',
                      style: TextStyle(
                          fontSize: 24,
                          color: colorUser.darkBlue,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center

                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:70 ,vertical:5 ),
                  child: button_home(
                    //une fonction ndiro fiha win 7abin nro7o
                    ontap: () {
                      //Navigator.pushNamed(context, quizz);
                    },

                    nom_image: 'MenuQuiz.gif',
                  ),
                ),

                Text(
                    ' Courses',
                    style: TextStyle(
                        fontSize: 24,
                        color: colorUser.darkBlue,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center

                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
