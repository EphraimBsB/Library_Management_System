import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:library_magement_sys/utils/app_exceptions.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/views/dialogs/snack.bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiBaseHelper {
  
final String _baseUrl = "http://localhost:5000/";
 var client = http.Client(); 
 var Snackbar = SnackBarDialog();
Future<dynamic> get(String url) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var responseJson;
    try {
      final response = await client.get(Uri.parse(_baseUrl + url),);
      responseJson = returnResponse(response);
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
      responseJson = returnResponse(response);
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
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
}

Future<dynamic> multipart(String url, fields, filePath, ebook) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var responseJson;
    try {
       var request = http.MultipartRequest("POST", Uri.parse(_baseUrl + url),);
      request.headers.addAll({
          r'Content-Type': 'application/json',
          r'Authorization': "Bearer $token",
        },);
      fields.forEach((k, v) => request.fields[k] = v);
    print('FIleService: ${filePath.name}');
      request.files.add(http.MultipartFile.fromBytes('image', filePath.bytes,
      contentType: MediaType('application', 'octet-stream'),filename: filePath.name,
    ),);
      request.files.add(http.MultipartFile.fromBytes('ebook', ebook.bytes,
      contentType: MediaType('application', 'octet-stream'),filename: ebook.name,
    ),);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    responseJson = returnResponse(response);
    return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
}

Future<dynamic> delete(String url) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var responseJson;
    try {
      final response = await client.delete(Uri.parse(_baseUrl + url),headers:{'Access-Control-Allow-Origin': '*', HttpHeaders.authorizationHeader:"Bearer $token"},);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
}

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = response.body;
      return responseJson;
    case 201:
      var responseJson = response.body;
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 409:
      Snackbar.dialog('Already Exist', Colors.red);
      throw ConflictsException(response.body.toString()); 
    case 401:
    case 403:
      Snackbar.dialog('Invalid Credentials', Colors.red);
      throw UnauthorisedException(response.body.toString());
    case 404:
      Get.defaultDialog(
         title: "Error",
         middleText: ' The Resource was Deleted',
       );
      throw BadRequestException('Deleted');
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

NetworkImage getImage(String urlImg){
  return NetworkImage(urlImg);
}
  
}