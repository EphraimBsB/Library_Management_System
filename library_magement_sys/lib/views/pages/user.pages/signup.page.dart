import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/controllers/users.controller/user.controller.dart';
import 'package:library_magement_sys/constants/app.bar.dart';
import 'package:library_magement_sys/constants/text.field.dart';
import 'package:library_magement_sys/views/dialogs/snack.bar.dart';

class SignupPage extends StatefulWidget {
  SignupPage({ Key? key }) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}
class _SignupPageState extends State<SignupPage> {
  TextEditingController name = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController course = TextEditingController();
  TextEditingController rollNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  UserController userController = Get.put(UserController());
  var _currentSelectedValue;
  final _roles = [
    "student",
    "librarian",
    "admin",
  ];
  var _degreeSelectedValue;
  final _degrees = [
    "undergraduate",
    "postgraduate",
    "lecturer"
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var Snackbar = SnackBarDialog();

    return  Scaffold(
      body: Container(
      padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppBarwidget(),
            Container(height: 10,),
             const Text(
                'Register',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              const  SizedBox(
                  height: 20,
                ),
            TextFieldWidget(label: 'Name', controller: name,),
              const  SizedBox(
                  height: 15,
                ),
              TextFieldWidget(label: 'Last-Name', controller: lastName,),
             const  SizedBox(
                  height: 15,
                ),
              TextFieldWidget(label: 'Roll-Number', controller: rollNumber,),
             const  SizedBox(
                  height: 15,
                ),
               TextFieldWidget(label: 'Course', controller: course,),
             const  SizedBox(
                  height: 15,
                ),
              SizedBox(
                  width: 0.4*width,
                  height: 40,
                  child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                  return InputDecorator(
                  decoration: InputDecoration(
                  labelText: 'Degree',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                  isEmpty: _degreeSelectedValue == '',
                  child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                  value: _degreeSelectedValue,
                  isDense: true,
                  onChanged: ( newValue) {
                    setState(() {
                      _degreeSelectedValue = newValue;
                      state.didChange(newValue);
                    });
                  },
                  items: _degrees.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
                ),
                const  SizedBox(
                  height: 15,
                ),
              TextFieldWidget(label: 'Email', controller: email,),
              const  SizedBox(
                  height: 15,
                ), 
              TextFieldWidget(label: 'Phone Number', controller: phoneNumber,),
              const  SizedBox(
                  height: 15,
                ),
              TextFieldWidget(label: 'Password', controller: password,),
              const  SizedBox(
                  height: 15,
                ),  
               SizedBox(
                  width: 0.4*width,
                  height: 40,
                  child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                  return InputDecorator(
                  decoration: InputDecoration(
                  labelText: 'Role',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                  isEmpty: _currentSelectedValue == '',
                  child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                  value: _currentSelectedValue,
                  isDense: true,
                  onChanged: ( newValue) {
                    setState(() {
                      _currentSelectedValue = newValue;
                      state.didChange(newValue);
                    });
                  },
                  items: _roles.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
                ),     
            const  SizedBox(
                  height: 20,
                ),
             TextButton(
                      onPressed: (){
                        String nameText = name.text.trim();
                        String lastNameText = lastName.text.trim();
                        String rollNumberText = rollNumber.text.trim();
                        String degreeText = _degreeSelectedValue;
                        String courseText = course.text.trim();
                        String emailText = email.text.trim();
                        String phoneNumberText = phoneNumber.text.trim();
                        String passwordText = password.text.trim();
                        String roleText = _currentSelectedValue;
                        if(
                          nameText.isEmpty || lastNameText.isEmpty || rollNumberText.isEmpty || courseText.isEmpty ||
                          emailText.isEmpty || phoneNumberText.isEmpty || passwordText.isEmpty ||roleText.isEmpty
                        ){
                          Snackbar.dialog('Please, Fill out all the form', Colors.red);
                        }
                          userController.userSignupController(nameText, lastNameText, rollNumberText, courseText, degreeText, emailText, phoneNumberText, passwordText, roleText);
                          
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