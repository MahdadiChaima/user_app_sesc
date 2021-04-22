import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:user_app_sesc/DataBase/DatabaseHelper.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/ContainerAppBar.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/inputField.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Bottom.dart';
import 'package:user_app_sesc/Ui/Home.dart';
import 'package:user_app_sesc/Ui/Sing%20Up.dart';
import 'package:user_app_sesc/Ui/forgetPassword.dart';
import 'package:form_field_validator/form_field_validator.dart';
final TextEditingController email = new TextEditingController();
final TextEditingController password = new TextEditingController();
class SingIn extends StatefulWidget {
  static String id = 'Signin';
  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  String msgStatus = '';



  final formKey=GlobalKey<FormState>();
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(6, errorText: 'password must be at least 6 digits long'),

  ]);


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(

            body: Form(//autovalidate: true,
                key: formKey,
                child: ListView(

                  children: [
                    containerAppBar("Sing In"),
                    SizedBox(height: size.width/5,),
                    Container(margin: EdgeInsets.only(left:size.width/20 ),alignment:Alignment.topLeft,
                        child:Text("Email:",style: TextStyle(color: colorUser.gray,fontSize: size.width/20,fontFamily: 'VarelaRound-Regular'),)),

                    Container( margin: EdgeInsets.only(left:size.width/30,right:size.width/30, ),child: TextFormField( validator: EmailValidator(errorText: 'enter a valid email address') ,controller: email,)),

                    SizedBox(height: size.width/10 ,),
                    Container(margin: EdgeInsets.only(left:size.width/20 ),alignment:Alignment.topLeft,
                        child: Text("Password:",style: TextStyle(color: colorUser.gray,fontSize: size.width/20,fontFamily: 'VarelaRound-Regular'),)),

                    Container( margin: EdgeInsets.only(left:size.width/30,right:size.width/30, ),child:TextFormField(validator:passwordValidator,obscureText: true, controller: password,)),
                    SizedBox(height: size.width/25 ,),
                    GestureDetector(child:Container(margin: EdgeInsets.only(right:size.width/30 ),alignment:Alignment.topRight,
                      child:GestureDetector(onTap: ()=>Navigator.of(context).pushNamed( forgetPassword.id),
                          child: Text("Forget password?",
                            style: TextStyle(fontWeight:FontWeight.w400,color: colorUser.darkBlue,fontSize: size.width/26,fontFamily: 'VarelaRound-Regular'),)),)),
                    SizedBox(height: size.width/3 ,),

                    bottom(
                      label: 'Sign in',
                      ontap: () {setState(() { if(formKey.currentState.validate()){

                        DatabaseHelper b = new DatabaseHelper();
                        b.loginData(email.text,password.text).whenComplete((){
                          print("Database halper :${b.status}");
                          if(b.status){
                            showDialog(
                                context:context ,
                                builder:(BuildContext context){
                                  return


                                  /*AlertDialog(
                                    content: Image.asset("assest/score_fail.PNG"),

                                    title:Text( "Failed"),
                                    style: AlertStyle(titleStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 30.0)),
                                    buttons: [
                                      DialogButton(
                                        color: colorUser.pink,
                                        child: Text(
                                          "Next",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        width: 120,
                                      )
                                    ],
                                  ).show();*/





                                  AlertDialog(
                                    title: new Text('Failed'),
                                    content:  new Text('Check your email or password'),
                                    actions: <Widget>[
                                      new  RaisedButton(
                                        child: new Text(
                                          'Close',
                                        ),
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        },

                                      ),
                                    ],
                                  );
                                }
                            );

                          }else{Navigator.pushNamed(context,Home.id);



                          msgStatus = 'Check email or password';

                          }
                        });



                      }

                      });

                      },
                    ),
                    SizedBox(height: size.width/25 ,),
                    Container(margin: EdgeInsets.only(right:size.width/20 ),child:Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                      Text("Dont have an account?",style: TextStyle(fontSize: size.width/25,color: colorUser.lightGray,fontFamily: 'VarelaRound-Regular'),),
                      GestureDetector(onTap: ()=>Navigator.of(context).pushNamed( SingUp.id),
                        child:Text("Sing Up",style: TextStyle(fontSize: size.width/24,color: colorUser.gray,fontFamily: 'VarelaRound-Regular'),),),
                    ],))

                  ],
                ))));

  }
}
