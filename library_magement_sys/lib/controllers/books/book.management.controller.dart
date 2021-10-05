import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/models/book.model/book.model.dart';
import 'package:library_magement_sys/models/book.model/single.book.model.dart';
import 'package:library_magement_sys/services/book.service/book.service.dart';

class BookManagementController extends GetxController{
  var isLoading = true.obs;
  var allbookslist = <Book>[].obs;

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

  @override
  void onInit(){
   createdBooks(titleTx, authorTx, ddcTx, accNumberTx, categoryTx, imageUrl, block, column, row);
   allCreatedBooks();
    super.onInit();
  }



  createdBooks(titleTx, authorTx, ddcTx, accNumberTx, categoryTx, imageUrl, block, column, row) async { 
   try{
    isLoading(true);
   var books = await BookService.allBooks(titleTx, authorTx, ddcTx, accNumberTx, categoryTx, imageUrl, block, column, row);
   var allBook = books!.first.books;
    allbookslist.value = allBook;
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
   
}
