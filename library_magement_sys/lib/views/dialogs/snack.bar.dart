import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarDialog {
  dialog(String message,var color){
     Get.snackbar(
      "", "Someting went wrong",
      messageText:   Text(
            message,
            style: TextStyle(
              fontSize: 26,
              color: color
              ),
            textAlign: TextAlign.center,
          ),
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.fromLTRB(50, 100, 50, 0),
          maxWidth: 500,
          colorText: Colors.red,
          animationDuration: const Duration(milliseconds: 2000)
          );
  }
  
}
