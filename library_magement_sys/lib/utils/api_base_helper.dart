import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:library_magement_sys/utils/app_exceptions.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiBaseHelper {
  
final String _baseUrl = "http://localhost:5000/";
 var client = http.Client(); 
Future<dynamic> get(String url) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var responseJson;
    try {
      final response = await client.get(Uri.parse(_baseUrl + url),);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
}

Future<dynamic> post(String url,body) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var responseJson;
    try {
      final response = await client.post(Uri.parse(_baseUrl + url),headers:{'Access-Control-Allow-Origin': '*', HttpHeaders.authorizationHeader:"Bearer $token"}, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
}

Future<dynamic> update(String url, body) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var responseJson;
    try {
      final response = await client.patch(Uri.parse(_baseUrl + url),headers:{'Access-Control-Allow-Origin': '*', HttpHeaders.authorizationHeader:"Bearer $token"}, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
}

Future<dynamic> delete(String url) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var responseJson;
    try {
      final response = await client.delete(Uri.parse(_baseUrl + url),headers:{'Access-Control-Allow-Origin': '*', HttpHeaders.authorizationHeader:"Bearer $token"},);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = response.body;
      // print('Response: $responseJson');
      return responseJson;
    case 201:
      var responseJson = response.body;
      // print('Response: $responseJson');
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 409:
      Get.snackbar(
      "", "Already Exist",
      messageText:  const Text(
            'Already Exist',
            style: TextStyle(
              fontSize: 26,
              color: Colors.red
              ),
            textAlign: TextAlign.center,
          ),
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.fromLTRB(50, 100, 50, 0),
          maxWidth: 500,
          colorText: Colors.red,
          animationDuration: const Duration(milliseconds: 2000)
          );
      throw ConflictsException(response.body.toString()); 
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
       Get.defaultDialog(
         title: "Error",
         middleText: 'Something went wrong',
         barrierDismissible: false,
       );
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
  
}