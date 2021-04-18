import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper{

  String serverUrl = "https://boiling-lake-40866.herokuapp.com/api/auth/";
  bool status =true ;

  var token ;

  loginData(String email , String password) async{

    Uri myurl = Uri.parse(
        "https://boiling-lake-40866.herokuapp.com/api/auth/login");
    http.post(myurl,
        body: {

          "email": "$email",
          "password": "$password",
        }).then((response) {
      //status = response.body.contains('bearer');
      status = response.body.contains('error');
      if (status) {
        print("Database halper inside her :${status}");
        print("email or pass incorrect");
      }else{

        print("Database halper inside her :${status}");
        Map mapValue = json.decode(response.body);
        print('rsponse body:${mapValue["access_token"].toString()}');
        _save(mapValue["access_token"]);
        read();


      }

    }
    );}
  // _save(data["access_token"]);
  registerData(String name ,String email , String password,String num_in) async{
print("$email");
    Uri myurl = Uri.parse(
        "https://boiling-lake-40866.herokuapp.com/api/auth/register");
    http.post(myurl,
        body: {
          "name": "$name",
          "email": "$email",
          "numero_ins": "$num_in",
          "password": "$password",
          "password_confirmation": "$password"
        }).then((response) {
      status = response.body.contains('message');
      if (status) {
        print('rsponse body:${response.body}');
        Map mapValue = json.decode(response.body);
        print('rsponse body:${mapValue.values.toString()}');
      }
      else{
        var h = response.body.contains('The email has already been taken');
        if (h) {
          print('The email has already been taken');
        }else{
          print("Num has already been taken");
        }
      }

    });
  }
  void addData(String name , String price) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    Uri myUrl = Uri.parse("$serverUrl/products");
    http.post(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
        body: {
          "name": "$name",
          "price" : "$price"
        }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }


  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    print('read : $value');
  }

}


