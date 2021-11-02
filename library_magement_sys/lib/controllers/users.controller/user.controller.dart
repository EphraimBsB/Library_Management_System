import 'package:get/get.dart';
import 'package:library_magement_sys/models/user.model/user.model.dart';
import 'package:library_magement_sys/services/user.services/user.service.dart';

class UserController extends GetxController{
  var isLoading = true.obs;
 var allUserslist = <User>[].obs;
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

   userSignupController(name, lastName, rollNumber, course, email, phoneNumber, password, role)async{
    var user = UserService.userSignupService(name, lastName, rollNumber, course, email, phoneNumber, password, role);
      return user;
  }

  allusers() async {
    var users = await  UserService.listAllUsers();
    var user = users.first.users;
    allUserslist.value = user;
  }
}