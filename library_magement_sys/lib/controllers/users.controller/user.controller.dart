import 'package:get/get.dart';
import 'package:library_magement_sys/services/user.services/user.service.dart';

class UserController extends GetxController{

  // @override
  // void onInit(){
  //   userSignupController();
  //   super.onInit();
  // }

  userLoginController(username, password)async{
    var user = UserService.userLoginService(username, password);
      return user;
  }

  librarianLoginController(username, password)async{
    var user = UserService.librarianLoginService(username, password);
      return user;
  }

   userSignupController(name, lastName, rollNumber, course, email, phoneNumber, password, role)async{
    var user = UserService.userSignupService(name, lastName, rollNumber, course, email, phoneNumber, password, role);
      return user;
  }
}