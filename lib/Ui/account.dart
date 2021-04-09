import 'package:flutter/material.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/ContainerAppBar.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/appBarwithiconMenu.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/inputField.dart';
import 'package:user_app_sesc/Ui/Home.dart';
import 'package:user_app_sesc/Ui/SingIn.dart';
import 'ConstantWidget/Bottom.dart';
final TextEditingController name = new TextEditingController();
final TextEditingController inscription_number = new TextEditingController();
final TextEditingController email = new TextEditingController();
final TextEditingController password = new TextEditingController();

class account extends StatelessWidget {

  static String id = 'account';
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(

          children: [
            appBarwithiconMenu("Account"),
            SizedBox(height: size.width/7,),
            Container(margin: EdgeInsets.only(left:size.width/30 ),alignment:Alignment.topLeft,child:Text("First and last name:",style: TextStyle(color: colorUser.gray,fontSize: size.width/22),)),

            inputField(contrl: name),
            SizedBox(height: size.width/10 ,),
            Container(margin: EdgeInsets.only(left:size.width/30 ),alignment:Alignment.topLeft,child: Text("Insccription Number:",style: TextStyle(color: colorUser.gray,fontSize: size.width/22),)),

            inputField(contrl:inscription_number),
            SizedBox(height: size.width/10 ,),
            Container(margin: EdgeInsets.only(left:size.width/30 ),alignment:Alignment.topLeft,child: Text("Email:",style: TextStyle(color: colorUser.gray,fontSize: size.width/22),)),

            inputField(contrl:email),
            SizedBox(height: size.width/10 ,),
            Container(margin: EdgeInsets.only(left:size.width/30 ),alignment:Alignment.topLeft,child: Text("Password:",style: TextStyle(color: colorUser.gray,fontSize: size.width/22),)),

            inputField(contrl:password),
            SizedBox(height: size.width/5 ,),

             bottom(

                label: 'Save',
                ontap: () {
                  Navigator.pushNamed(context,Home.id);
                },
              ),



          ],
        ),
      ),
    );
  }
}
