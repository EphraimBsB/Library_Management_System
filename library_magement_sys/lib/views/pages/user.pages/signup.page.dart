import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/controllers/users.controller/user.controller.dart';
import 'package:library_magement_sys/models/user.model/user.model.dart';
import 'package:library_magement_sys/views/pages/loan.pages/student.loan.page.dart';
import 'package:library_magement_sys/views/pages/user.pages/login.page.dart';
import 'package:library_magement_sys/views/widgets/app.bar.dart';
import 'package:library_magement_sys/views/widgets/text.field.dart';

class SignupPage extends StatelessWidget {
  SignupPage({ Key? key }) : super(key: key);
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    // UserModel userModel = UserModel(name: '', lastName: '', rollNumber: '', email: '', phoneNumber: '', password: '', role: '');

    TextEditingController name = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController rollNumber = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phoneNumber = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController role = TextEditingController();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppBarwidget(),
          Container(height: height*0.1,),
           const Text(
              'Register',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            const  SizedBox(
                height: 50,
              ),
          TextFieldWidget(label: 'Name', controller: name,),
            const  SizedBox(
                height: 20,
              ),
            TextFieldWidget(label: 'Last-Name', controller: lastName,),
           const  SizedBox(
                height: 20,
              ),
            TextFieldWidget(label: 'Roll-Number', controller: rollNumber,),
           const  SizedBox(
                height: 20,
              ),
            TextFieldWidget(label: 'Email', controller: email,),
            const  SizedBox(
                height: 20,
              ), 
            TextFieldWidget(label: 'Phone Number', controller: phoneNumber,),
            const  SizedBox(
                height: 20,
              ),
            TextFieldWidget(label: 'Password', controller: password,),
            const  SizedBox(
                height: 20,
              ),  
            TextFieldWidget(label: 'Role', controller: role,),     
          const  SizedBox(
                height: 20,
              ),
           TextButton(
                    onPressed: (){
                      String nameText = name.text.trim();
                      String lastNameText = lastName.text.trim();
                      String rollNumberText = rollNumber.text.trim();
                      String emailText = email.text.trim();
                      String phoneNumberText = phoneNumber.text.trim();
                      String passwordText = password.text.trim();
                      String roleText = role.text.trim();
                      
                      if(userController != null) {
                        userController.userSignupController(nameText, lastNameText, rollNumberText, emailText, phoneNumberText, passwordText, roleText);
                        Get.snackbar("Sucess", "All Good",snackPosition: SnackPosition.TOP);
                        // Get.to(() => LoginPage());
                        Get.toNamed("/loans");
                      }else{
                        Get.snackbar("Error", "Server Errror",snackPosition: SnackPosition.TOP);
                      }
                    }, 
                    child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(5, 38, 154, 5),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: const Text('Register',
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