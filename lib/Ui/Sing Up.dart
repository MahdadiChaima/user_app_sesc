import 'package:flutter/material.dart';
import 'package:user_app_sesc/DataBase/DatabaseHelper.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/ContainerAppBar.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/Color.dart';
import 'package:user_app_sesc/Ui/ConstantWidget/inputField.dart';
import 'package:user_app_sesc/Ui/Home.dart';
import 'package:user_app_sesc/Ui/SingIn.dart';
import 'ConstantWidget/Bottom.dart';
import 'package:form_field_validator/form_field_validator.dart';
final TextEditingController name = new TextEditingController();
final TextEditingController inscription_number = new TextEditingController();
final TextEditingController email = new TextEditingController();
final TextEditingController password = new TextEditingController();
final TextEditingController confirmationpassword = new TextEditingController();

final TextEditingController unevirsity = new TextEditingController();
final TextEditingController specilaity = new TextEditingController();
final TextEditingController study_year = new TextEditingController();







class SingUp extends StatefulWidget {  static String id = 'signup';
  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  String pass;
  final formKey=GlobalKey<FormState>();
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(6, errorText: 'password must be at least 6 digits long'),

  ]);
  final nameValidator = MultiValidator([
    RequiredValidator(errorText: 'name is required'),
    MinLengthValidator(2, errorText: 'name must be at least 2 characters'),
    MaxLengthValidator(20, errorText: 'name must be at most 20 characters')

  ]);
  final inscNumberValidator = MultiValidator([
    RequiredValidator(errorText: 'number is required'),
    MinLengthValidator(10, errorText: 'number  must be at least 10 characters'),
    MaxLengthValidator(20, errorText: 'number must be at most 12 characters')

  ]);

  String valueChooseYear;
  List ListYear=[
    "First year","Second year","Third year","Fourth year","Fifth year","Sixth year"
  ];





  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Form(
          key:formKey,
          child: ListView(

            children: [


              containerAppBar("Sing Up"),
              SizedBox(height: size.width/7,),


              Container(margin: EdgeInsets.only(left:size.width/30 ),alignment:Alignment.topLeft,child:Text("First and last name:",style: TextStyle(color: colorUser.gray,fontSize: size.width/22),)),
          Container(width: size.width,
              margin: EdgeInsets.only(left:size.width/30,right:size.width/30, ),child: TextFormField(validator:nameValidator,
                controller: name,)),

              SizedBox(height: size.width/10 ,),

              Container(margin: EdgeInsets.only(left:size.width/30 ),alignment:Alignment.topLeft,child: Text("Inscription Number:",style: TextStyle(color: colorUser.gray,fontSize: size.width/22),)),
           Container( margin: EdgeInsets.only(left:size.width/30,right:size.width/30, ),child: TextFormField(validator:inscNumberValidator,
             controller: inscription_number,)),
              SizedBox(height: size.width/10 ,),



             /* Container(margin: EdgeInsets.only(left:size.width/30 ),alignment:Alignment.topLeft,child: Text("University:",style: TextStyle(color: colorUser.gray,fontSize: size.width/22),)),
              inputField(contrl:unevirsity),
              SizedBox(height: size.width/10 ,),

              Container(margin: EdgeInsets.only(left:size.width/30 ),alignment:Alignment.topLeft,child: Text("specilaity:",style: TextStyle(color: colorUser.gray,fontSize: size.width/22),)),
              inputField(contrl:specilaity),
              SizedBox(height: size.width/10 ,),

              Container(margin: EdgeInsets.only(left:size.width/30 ),alignment:Alignment.topLeft,child: Text("Study Year:",style: TextStyle(color: colorUser.gray,fontSize: size.width/22),)),
              Center(child: Container(width: size.width,padding:EdgeInsets.only(bottom:size.width/30,top:size.width/30, ),
                margin: EdgeInsets.only(left:size.width/30,right:size.width/30, ),child: DropdownButton(hint: Text("Select"), isExpanded: true,dropdownColor: Colors.white70,
                    value: valueChooseYear,
                    onChanged: (newvalue){
                      setState((){
                        valueChooseYear=newvalue;
                      });},
                    items: ListYear.map((value_item) {
                      return DropdownMenuItem(
                          value:value_item,
                          child:Text(value_item,style: TextStyle(color: colorUser.darkBlue,fontSize: size.width/22),)
                      );
                    }
                    ).toList()),)),

              SizedBox(height: size.width/15 ,),*/

              Container(margin: EdgeInsets.only(left:size.width/30 ),alignment:Alignment.topLeft,child: Text("Email:",style: TextStyle(color: colorUser.gray,fontSize: size.width/22),)),
              Container( margin: EdgeInsets.only(left:size.width/30,right:size.width/30, ),child: TextFormField( validator: EmailValidator(errorText: 'enter a valid email address') ,
                controller: email,)),
              SizedBox(height: size.width/10 ,),

              Container(margin: EdgeInsets.only(left:size.width/30 ),alignment:Alignment.topLeft,child: Text("Password:",style: TextStyle(color: colorUser.gray,fontSize: size.width/22),)),
              Container( margin: EdgeInsets.only(left:size.width/30,right:size.width/30, ),child: TextFormField(validator:passwordValidator,obscureText: true,
                onChanged: (val) => pass = val,  controller: password,)),
              SizedBox(height: size.width/7 ,),
              Container(margin: EdgeInsets.only(left:size.width/30 ),alignment:Alignment.topLeft,child: Text("Confirmation Password:",style: TextStyle(color: colorUser.gray,fontSize: size.width/22),)),
              Container( margin: EdgeInsets.only(left:size.width/30,right:size.width/30, ),child: TextFormField(
                validator: (val) => MatchValidator(errorText: 'passwords do not match').validateMatch(val, pass),
                obscureText: true,
                controller: confirmationpassword,)),
              SizedBox(height: size.width/7 ,),
             Expanded(
               child: bottom(

                 label: 'Sign up',
                 ontap: () {if(formKey.currentState.validate()){
                   setState(() {
                        DatabaseHelper databaseHelper= new DatabaseHelper();

                           databaseHelper.registerData(name.text,email.text,password.text,inscription_number.text).whenComplete((){
                             if(databaseHelper.status){
                          showDialog(context:context ,builder:(BuildContext context){
                            return AlertDialog(
                                 title: new Text('Failed'),
                                 content:  new Text('Check your email or password'),actions: <Widget>[
                                 new  RaisedButton(child: new Text('Close',),onPressed: (){
                                Navigator.of(context).pop();},),],);});

                             }else{   Navigator.pushNamed(context,Home.id);

                             }
                           });



                   });}

                 },
               ),
             ),
              SizedBox(height: size.width/25 ,),
              Container(margin: EdgeInsets.only(right:size.width/20 ),child:Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Text("Already have an account?",style: TextStyle(fontSize: size.width/25,color: colorUser.lightGray),),
                GestureDetector(onTap: ()=>Navigator.of(context).pushNamed( SingIn.id),child:Text("Sing In",style: TextStyle(
                    fontSize: size.width/24,color: colorUser.gray),),),
              ],))

            ],
          ),
        ),
      ),
    );
  }
}
