import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/controllers/users.controller/user.controller.dart';
import 'package:library_magement_sys/constants/app.bar.dart';
import 'package:library_magement_sys/constants/text.field.dart';
import 'package:library_magement_sys/views/dialogs/snack.bar.dart';

class SignupPage extends StatelessWidget {
  SignupPage({ Key? key }) : super(key: key);
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController course = TextEditingController();
    TextEditingController rollNumber = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phoneNumber = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController role = TextEditingController();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var Snackbar = SnackBarDialog();

    return  Container(
      padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppBarwidget(),
            Container(height: 20,),
             const Text(
                'Register',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              const  SizedBox(
                  height: 30,
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
               TextFieldWidget(label: 'Course', controller: course,),
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
                        String courseText = course.text.trim();
                        String emailText = email.text.trim();
                        String phoneNumberText = phoneNumber.text.trim();
                        String passwordText = password.text.trim();
                        String roleText = role.text.trim();
                        if(
                          nameText.isEmpty || lastNameText.isEmpty || rollNumberText.isEmpty || courseText.isEmpty ||
                          emailText.isEmpty || phoneNumberText.isEmpty || passwordText.isEmpty ||roleText.isEmpty
                        ){
                          Snackbar.dialog('Please, Fill out all the form', Colors.red);
                        }
                          userController.userSignupController(nameText, lastNameText, rollNumberText, courseText, emailText, phoneNumberText, passwordText, roleText);
                          Snackbar.dialog('Register Sucefully, Login', Colors.green);
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
      ),
    );
  }
}