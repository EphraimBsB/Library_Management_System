import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/controllers/loans/loan.controller.dart';
import 'package:library_magement_sys/controllers/users.controller/user.controller.dart';
import 'package:library_magement_sys/constants/app.bar.dart';
import 'package:library_magement_sys/constants/text.field.dart';
import 'package:library_magement_sys/models/book.model/single.book.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final SingleBook? book;
  LoginPage([this.book]);
  UserController userController = Get.put(UserController());
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController access = TextEditingController();
  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // print('BOOK ID: $bookId');
    return Scaffold(
      body: Container(
      padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppBarwidget(),
            Container(height: height*0.2,),
             const Text(
                'Login',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              const  SizedBox(
                  height: 50,
                ),
            TextFieldWidget(label: 'Roll Number', controller: username,),
              const  SizedBox(
                  height: 20,
                ),
              SizedBox(
                   width: 0.4*width,
                   height: 40,
                   child:  TextField(
                     controller: password,
                     obscureText: true,
                     decoration: const InputDecoration(
                       label: Text('Password'),
                       border: OutlineInputBorder()
                     ),
                   ),
                 ),
                 const  SizedBox(
                  height: 20,
                ),
             TextFieldWidget(label: 'Book Access No', controller: access,),
            const  SizedBox(
                  height: 20,
                ),
             TextButton(
                      onPressed: ()async{
                        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                        LoanController loanController = Get.put(LoanController());
                        int? bookId = sharedPreferences.getInt('bookId');
                        String accessText = access.text.trim();
                        String usernameText = username.text.trim();
                        String passwordText = password.text;
                        
                        if(usernameText.isEmpty || usernameText.length<3 || passwordText.isEmpty || passwordText.length <6){
                          return Get.snackbar("Error", "Wrong Credentials",snackPosition: SnackPosition.TOP);
                        }else if(accessText.isEmpty || accessText.length<4){
                          return Get.snackbar("Error", "Wrong Book Access Number",snackPosition: SnackPosition.TOP);
                        }
                        await userController.userLoginController(usernameText, passwordText);
                        await loanController.createaLoan(bookId, accessText);
                      },
                      child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(5, 38, 154, 5),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: const Text('Login',
                      style: TextStyle(
                              color: Colors.white
                            ),),
                      )
                   ),
          ]
        ),
      ),
    );
  }
}