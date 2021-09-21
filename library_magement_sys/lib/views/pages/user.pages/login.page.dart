import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/controllers/users.controller/user.controller.dart';
import 'package:library_magement_sys/views/pages/book.pages/searched.book.page.dart';
import 'package:library_magement_sys/views/pages/user.pages/signup.page.dart';
import 'package:library_magement_sys/views/widgets/app.bar.dart';
import 'package:library_magement_sys/views/widgets/text.field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({ Key? key }) : super(key: key);
  UserController userController = Get.put(UserController());
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
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
           TextFieldWidget(label: 'Password', controller: password,),
          const  SizedBox(
                height: 20,
              ),
           TextButton(
                    onPressed: (){
                      String usernameText = username.text.trim();
                      String passwordText = password.text;
                      if(usernameText.isEmpty || usernameText.length<3){
                        return Get.snackbar("Error", "Wrong Roll Number",snackPosition: SnackPosition.TOP);
                      }else if(passwordText.isEmpty || passwordText.length <6){
                        return Get.snackbar("Error", "Wrong Password",snackPosition: SnackPosition.TOP);
                      }
                      var user = userController.userLoginController(usernameText, passwordText);
                      
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
    );
  }
}