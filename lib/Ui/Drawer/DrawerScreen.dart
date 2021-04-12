import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:user_app_sesc/Ui/Courses.dart';
import 'package:user_app_sesc/Ui/Sing%20Up.dart';
import 'package:user_app_sesc/Ui/SingIn.dart';
import 'package:user_app_sesc/Ui/account.dart';
import 'package:user_app_sesc/Ui/score.dart';


class drawer extends StatelessWidget {
  static String id = 'drawer';
  const drawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void ShowRate(){
showDialog(context: context, builder: (context){
  return RatingDialog(title: "Rating Our app",

      message: "Tap a star to set your rating",
      //image: image,//TODO: ndiro image nta3 logo nta3na
      submitButton:'Submit',
    onSubmitted: (response) {
      // TODO: open the app's page on Google Play
      print('rating: ${response.rating},, comment: ${response.comment} }');


      if (response.rating < 3.0) {
        // send their comments to your email or anywhere you wish
        // ask the user to contact you instead of leaving a bad review
      }
    },
  );
});
    }
    Size size=MediaQuery.of(context).size;
    return
      ListView(children: [
        Container( decoration:BoxDecoration(gradient:LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [colorUser.lightBlue, colorUser.darkBlue]),),
          child: Padding(

            padding: EdgeInsets.only(top: size.width/10,bottom: size.width/10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [//TODO: image njiboha mn cont nta3o nta3 gmail n7a6oha dakhl image(Cirlcle Avatar )wala ndiro logo nta3 app
                /*CircleAvatar(
                  radius: 50.0,

                  backgroundImage: NetworkImage(""   ),),
                SizedBox(
                  height: 5.0,
                ),*/
                //TODO:first Name w last name nta3o
                Text(
                  "",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w800,
                      fontFamily: 'VarelaRound-Regular'
                  ),

                ),

              ],
            ),
          ),
        ),
        SizedBox(
          height: size.width/8,
        ),
        //Now let's Add the button for the Menu
        //and let's copy that and modify it
        ListTile(
          onTap:()=>Navigator.pushNamed(context,account.id),
          leading: Icon(
            Icons.account_circle,
            color: colorUser.darkBlue,
          ),
          title: Text("بروفايلك",style: TextStyle(
            fontSize:size.width/22 ,
            color: colorUser.gray,
              fontFamily: 'Tajawal-Regular'
          ),),
        ),

        ListTile(
          onTap: () {Navigator.pushNamed(context,Score.id);},
          leading: Icon(
            Icons.poll,
            color: colorUser.darkBlue,
          ),
          title: Text("نقاطك",style: TextStyle(
            fontSize:size.width/22 ,
            color: colorUser.gray,
              fontFamily: 'Tajawal-Regular'
          ),),
        ),

        ListTile(
          onTap:   ()=>Navigator.pushNamed(context,Courses.id),
          leading: Icon(
            Icons.menu_book,
            color: colorUser.darkBlue,
          ),
          title: Text("دروس",style: TextStyle(
            fontSize:size.width/22 ,
            color: colorUser.gray,
              fontFamily: 'Tajawal-Regular'
          ),),
        ),

        ListTile(
          onTap: ShowRate,
          leading: Icon(
            Icons.star,
            color: colorUser.darkBlue,
          ),
          title: Text("تقييم التطبيق",style: TextStyle(
            fontSize:size.width/22 ,
            color: colorUser.gray,
              fontFamily: 'Tajawal-Regular'
          ),),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.help,
            color: colorUser.darkBlue,
          ),
          title: Text("مساعدة",style: TextStyle(
            fontSize:size.width/22 ,
            color: colorUser.gray,
              fontFamily: 'Tajawal-Regular'
          ),),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.share,
            color: colorUser.darkBlue,
          ),
          title: Text("مشاركة",style: TextStyle(
            fontSize:size.width/22 ,
            color: colorUser.gray,
              fontFamily: 'Tajawal-Regular'
          ),),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.people_rounded,
            color: colorUser.darkBlue,
          ),
          title: Text("أنشئ من طرف",style: TextStyle(
            fontSize:size.width/22 ,
            color: colorUser.gray,
              fontFamily: 'Tajawal-Regular'
          ),),
        ),

        ListTile(
          onTap: () {
            Navigator.pushNamed(context,SingIn.id);
          },
          leading: Icon(
            Icons.logout,
            color: colorUser.darkBlue,
          ),
          title: Text("خروج",style: TextStyle(
            fontSize:size.width/22 ,
            color: colorUser.gray,
              fontFamily: 'Tajawal-Regular'
          ),),
        ),
      ]);
  }}

