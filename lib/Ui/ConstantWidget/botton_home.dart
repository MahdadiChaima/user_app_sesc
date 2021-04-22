import 'package:flutter/material.dart';

class button_home extends StatelessWidget {
  button_home(
      {@required this.nom_image, @required this.ontap});
  final String nom_image;

  final Function ontap;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return GestureDetector(
      //la methode onTap sert a fait action listener
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.all(9.0),
        //je fais card au lieu container car il a une shadow
        child: Card(
          elevation: 10.0,
          margin: EdgeInsets.all(2.0),
          //pour radius
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

               Image.asset('assest/$nom_image',width: size.width/2,height: size.width/2,fit: BoxFit.cover, ),


            ],
          ),
        ),
      ),
    );
  }
}