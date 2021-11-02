import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/models/book.model/book.model.dart';
import 'package:library_magement_sys/models/book.model/single.book.model.dart';
import 'package:library_magement_sys/services/book.service/book.service.dart';
import 'package:library_magement_sys/views/dialogs/snack.bar.dart';

class BookManagementController extends GetxController{
  var isLoading = true.obs;
  var allbookslist = <Book>[].obs;
  var Snackbar = SnackBarDialog();

  get searchText => null;

  get accNumberTx => null;

  get authorTx => null;

  get block => null;

  get categoryTx => null;

  get column => null;

  get ddcTx => null;

  get imageUrl => null;

  get row => null;

  get titleTx => null;

  get copiesTx => null;

  get descriptionText => null;

  @override
  void onInit(){
   allCreatedBooks();
    super.onInit();
  }

  createdBooks(titleTx, authorTx, descriptionTx, ddcTx, accNumberTx, categoryTx, copiesTx, imageUrl, block, column, row) async { 
   try{
    isLoading(true);
   var book = await BookService.create(titleTx, authorTx, descriptionTx, ddcTx, accNumberTx, categoryTx, copiesTx, imageUrl, block, column, row);
   Snackbar.dialog('Book ${book!.message}', Colors.green);
   }finally{
     isLoading(false);
   }
  }

  allCreatedBooks() async { 
   try{
    isLoading(true);
   var books = await BookService.listAllBooks();
   var allBook = books!.first.books;
    allbookslist.value = allBook;
   }finally{
     isLoading(false);
   }
  }

  exportExcel()async{
    var file = await BookService.export();
    var message = file.toString().split(':');
    Snackbar.dialog(message.elementAt(1), Colors.green);
  }
   
  deleteABook(id) async{
    var res = await BookService.deleteBook(id);
    var message = res.toString().split(':');
    Snackbar.dialog(message.elementAt(1), Colors.green);
  }
}
