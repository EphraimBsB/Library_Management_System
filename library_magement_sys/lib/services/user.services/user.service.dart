import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService{
  static var client = http.Client();
  
  static Future userLoginService(String username, String password) async{
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map  body = {
      'roll_number':username,
      'password':password,
    };

    var response = await client.post(Uri.parse("http://localhost:5000/users/login"),headers:{'Access-Control-Allow-Origin': '*'}, body: body);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      var token = sharedPreferences.setString("token", jsonData['token']);
      Get.toNamed("/student_loans");
      return jsonData;
    }else{
      return Get.snackbar("Error", "Invali Credentials",snackPosition: SnackPosition.TOP);
    }
  }

  static Future librarianLoginService(String username, String password) async{
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map  body = {
      'roll_number':username,
      'password':password,
    };

    var response = await client.post(Uri.parse("http://localhost:5000/users/login"),headers:{'Access-Control-Allow-Origin': '*'}, body: body);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      var token = sharedPreferences.setString("token", jsonData['token']);
      Get.toNamed("/books_management");
      return jsonData;
    }else{
      return Get.snackbar("Error", "Invali Credentials",snackPosition: SnackPosition.TOP);
    }
  }

  static Future userSignupService(name, lastName, rollNumber, email, phoneNumber, password, role) async {
     Map  body = {
      'name': name,
      'last_name':lastName,
      'roll_number': rollNumber,
      'email': email,
      'phone_number': phoneNumber,
      'password': password,
      'role': role,
    };

    var response = await client.post(Uri.parse("http://localhost:5000/users/register"),headers:{'Access-Control-Allow-Origin': '*'}, body: body);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      return jsonData;
    }else{
      return null;
    }
  }

}