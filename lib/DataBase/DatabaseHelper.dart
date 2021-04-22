import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper{

  String serverUrl = "https://boiling-lake-40866.herokuapp.com/api/auth/";
  bool status  ;

  var token ;

  loginData(String email , String password) async{

    Uri myurl = Uri.parse(
        "https://gentle-beyond-10891.herokuapp.com/api/login");
    final response = await http.post(myurl,
        body: {

          "email": "$email",
          "password": "$password",
        });

      status = response.body.contains('error');
      //status = response.body.contains('error');
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
  // _save(data["access_token"]);
  registerData(String name ,String email , String password,String num_in) async{
print("$email");
    Uri myurl = Uri.parse(
        "https://gentle-beyond-10891.herokuapp.com/api/register");
final response = await  http.post(myurl,
        body: {
          "name": "$name",
          "email": "$email",
          "numero_ins": "$num_in",
          "password": "$password",
          "password_confirmation": "$password"
        });
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
  Future<List> getData() async{

    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    Uri myurl = Uri.parse("https://gentle-beyond-10891.herokuapp.com/api/Question");

    http.Response response = await http.get(myurl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        });
    print(response.body);
    var data =jsonDecode(response.body);
    return data;
  }
  static UpdateScore(int id,int score )async{

    Uri myUrl = Uri.parse("https://gentle-beyond-10891.herokuapp.com/api/user/6");
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    print(value);
    http.Response response = await http.put(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
        body: {
          "score": "$score"

        });
    print(json.decode(response.body));
  }






}


