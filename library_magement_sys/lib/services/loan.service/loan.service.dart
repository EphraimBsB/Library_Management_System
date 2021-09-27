import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:library_magement_sys/models/loan.model/all.loans.model.dart';
import 'package:library_magement_sys/models/loan.model/loan.model.dart';
import 'package:library_magement_sys/models/loan.model/model.dart';
import 'package:library_magement_sys/models/loan.model/single.loan.model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';

class LoanService{
  static var client = http.Client();

 static Future<LoanModel?>createLoan(bookId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    Map<String, dynamic> payload = Jwt.parseJwt(token!);
    var userId = payload['id'];
   print("bookId: $bookId");
   Map  body = {
      'userId':'$userId',
      'bookId':'$bookId',
    };

   var response = await client.post(Uri.parse("http://localhost:5000/loan/"), headers: {'Access-Control-Allow-Origin': '*', HttpHeaders.authorizationHeader:"Bearer $token"},body: body);
   if(response.statusCode == 201){
     String jsonString = response.body;
    var loan = loanModelFromJson(jsonString);
    return loan;
   }else{
     return null;
   }

  }

  static Future<List<LoansModel>?>studentLoans() async {
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    Map<String, dynamic> payload = Jwt.parseJwt(token!);
    // var loan = await createLoan(book);
    var id = payload['id'];
   var response = await client.get(Uri.parse("http://localhost:5000/loan/userloans/$id"), headers: {'Access-Control-Allow-Origin': '*', HttpHeaders.authorizationHeader:"Bearer $token"
});
   if(response.statusCode == 200){
     String jsonString = response.body;
    var stdloans = loansModelFromJson(jsonString);
    return [stdloans];
   }else{
     return null;
   }

  }

   static Future<List<AllLoansModel>?>allLoans() async {
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
   
   var response = await client.patch(Uri.parse("http://localhost:5000/loan/loans"), headers: {'Access-Control-Allow-Origin': '*',HttpHeaders.authorizationHeader:"Bearer $token"});
   if(response.statusCode == 200){
     String jsonString = response.body;
    var stdloans = allLoansModelFromJson(jsonString);
    return [stdloans];
   }else{
     return null;
   }

  }

  static Future<SingleLoanModel?> singleLoan(id)async{
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    Map  body = {
      'action': 'true',
    };
    var response = await client.patch(Uri.parse("http://localhost:5000/loan/loans/$id"), headers: {'Access-Control-Allow-Origin': '*', HttpHeaders.authorizationHeader:"Bearer $token"}, body: body);

    if(response.statusCode == 200){
      String jsonString = response.body;
     
    
    var loan = singleLoanModelFromJson(jsonString);
    print("Loan: $loan");
    return loan;
      
    }else{
      return null;
    }
  }

}