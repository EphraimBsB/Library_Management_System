import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/models/user.model/user.model.dart';
import 'package:library_magement_sys/services/user.services/user.service.dart';
import 'package:library_magement_sys/views/dialogs/snack.bar.dart';

class UserController extends GetxController{
  var isLoading = true.obs;
 var allUserslist = <User>[].obs;
 var Snackbar = SnackBarDialog();
  @override
  void onInit(){
    allusers();
    super.onInit();
  }

  userLoginController(username, password)async{
    var user = UserService.userLoginService(username, password);
      return user;
  }

  librarianLoginController(username, password)async{
    var user = UserService.librarianLoginService(username, password);
      return user;
  }

   userSignupController(name, lastName, rollNumber, course, degree, email, phoneNumber, password, role)async{
    var user = UserService.userSignupService(name, lastName, rollNumber, course, degree, email, phoneNumber, password, role);
    Snackbar.dialog('Register Sucefully, Login', Colors.green);
      return user;
  }

  allusers() async {
    var users = await  UserService.listAllUsers();
    var user = users.first.users;
    allUserslist.value = user;
  }
}