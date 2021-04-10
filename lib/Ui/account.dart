import 'package:flutter/material.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/ContainerAppBar.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/appBarwithiconMenu.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/inputField.dart';
import 'package:user_app_sesc/Ui/Home.dart';
import 'package:user_app_sesc/Ui/SingIn.dart';
import 'package:user_app_sesc/Ui/Drawer/DrawerScreen.dart';
import 'package:user_app_sesc/Ui/Drawer/DrawerScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
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
    GlobalKey <ScaffoldState> _scaffoldKey =GlobalKey<ScaffoldState>();
    return SafeArea(

      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child:drawer(),
        ),
        body: ListView(

          children: [
            Stack(children: [ Container(

              width: size.width,height: size.width/1.4,
//p
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assest/user.jpg"),
                        radius: size.width/6.2,
                        foregroundColor: Colors.deepOrange,

                      ),
                    ),
                  ),

                  Center(
                    // TODO: tet3amer a partir la bd .
                    child: Text('Amina Khacha',style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width/11,
                      fontWeight: FontWeight.bold,

                    ),),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  gradient:LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [colorUser.lightBlue, colorUser.darkBlue]),
               //  color: Colors.white,
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
            SizedBox(
              height: size.height/10,
            ),

            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: ListTile(
                leading: Icon(
                  Icons.mail_outline,
                  color: colorUser.lightBlue,
                ),
                // TODO: tet3amer a partir la bd email.
                title: Text(
                  'aminakh@gmail.com',
                  style: TextStyle(
                    color: colorUser.darkGray,
                    //  fontFamily: 'ionicons',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: ListTile(
                leading: Icon(
                  Icons.assignment_ind_outlined,
                  color: colorUser.lightBlue,
                ),
                // TODO: tet3amer a partir la bd email.
                title: Text(
                  '171735057399',
                  style: TextStyle(
                    color: colorUser.darkGray,
                    //  fontFamily: 'ionicons',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height/10,
            ),

            Center(
              child: GestureDetector(
                child:Text(
                  'update your password',
                  style: TextStyle(
                      fontWeight:FontWeight.w600,color: colorUser.darkBlue,fontSize: size.width/22
                  ),
                ),
                onTap:() {

                  Alert(
                      context: context,
                      title: "UPDATE PASSWORD",
                      content: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: 'Old password',
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: ' New password',
                            ),
                          ),
                        ],
                      ),
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
                      ]).show();
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
