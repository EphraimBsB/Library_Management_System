import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:library_magement_sys/utils/api_base_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService{
  static final ApiBaseHelper _helper = ApiBaseHelper();
  static var client = http.Client();
  
  static Future userLoginService(String username, String password) async{
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map  body = {
      'roll_number':username,
      'password':password,
    };

    var response = await _helper.post("users/login",body);
    var responseBody = jsonDecode(response);
      var token = sharedPreferences.setString("token", responseBody['token']);
      Get.offNamed("/student_loans");
  }

  static Future librarianLoginService(String username, String password) async{
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     
    Map  body = {
      'roll_number':username,
      'password':password,
    };

    var response = await _helper.post("users/login",body);
    var responseBody = jsonDecode(response);
      var token = sharedPreferences.setString("token", responseBody['token']);
      var user = sharedPreferences.getString("token");
      Map<String, dynamic> payload = Jwt.parseJwt(user!);
      var role = payload['role'];
      if(role == 'student'){
        Get.defaultDialog(
         middleText: 'Access Dienied',
         middleTextStyle:  const TextStyle(
              fontSize: 26,
              color: Colors.red
              ),
       );
      }else{
        Get.offNamed("/books_management");
      }
  }

  static Future userSignupService(name, lastName, rollNumber, course, email, phoneNumber, password, role) async {
     Map  body = {
      'name': name,
      'last_name':lastName,
      'roll_number': rollNumber,
      'course': course,
      'email': email,
      'phone_number': phoneNumber,
      'password': password,
      'role': role,
    };

    var response = await _helper.post("users/register",body);
      return response;
  }

}