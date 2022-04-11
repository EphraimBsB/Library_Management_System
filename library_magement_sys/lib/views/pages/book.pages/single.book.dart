import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/controllers/books/book.controller.dart';
import 'package:library_magement_sys/views/widgets/single.book.widget.dart';

class SingleBook extends StatelessWidget {
    SingleBook({ Key? key, }) : super(key: key);

  final BookController bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
        child: Obx(() => ListView.builder(
          itemCount:bookController.showBook.length ,
          itemBuilder: (context, index){
                     return SingleBookWidget(bookController.showBook[index]);
                   },   
          ), ),
      )
      
      
    );
  }
}