import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/controllers/books/book.controller.dart';
import 'package:library_magement_sys/views/pages/user.pages/login.page.dart';
import 'package:library_magement_sys/views/widgets/app.bar.dart';
import 'package:library_magement_sys/views/widgets/show.book.widget.dart';

class SearchedBook extends StatelessWidget {
    SearchedBook({ Key? key, }) : super(key: key);

   final BookController bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ListView.builder(
        itemCount:bookController.showBook.length ,
        itemBuilder: (context, index){
                   return ShowBookWidget(bookController.showBook[index]);
                 },   
        ), )
      
      
    );
  }
}