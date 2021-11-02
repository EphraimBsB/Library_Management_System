import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/models/book.model/book.model.dart';
import 'package:library_magement_sys/models/book.model/single.book.model.dart';
import 'package:library_magement_sys/services/book.service/book.service.dart';

class BookController extends GetxController{
  var isLoading = true.obs;
  var bookslist = <Book>[].obs;
  var showBook = <SingleBook>[].obs;
  var searchTextBook;

  get searchText => null;

  @override
  void onInit(){
    bookSearch(searchText);
    search();
    super.onInit();
  }

  bookSearch(searchText) async { 
   try{
    isLoading(true);
   var book = await BookService.search(searchText);
   var books = book!.first.books;
   if(book != null){
     bookslist.value = books;
   }
   }finally{
     isLoading(false);
   }
  }

  search() async { 
    var searchText = Get.arguments;
    searchTextBook = searchText;
   try{
    isLoading(true);
   var book = await BookService.search(searchText);
   var books = book!.first.books;
   if(book != null){
     bookslist.value = books;
   }
   }finally{
     isLoading(false);
   }
  }

  findOneBook() async { 
  var id = Get.parameters['id'];
   try{
    isLoading(true);
   var book = await BookService.oneBook(id);
   var findBook = book!.book;
    showBook.value = [findBook];
   }finally{
     isLoading(false);
   }
  }
   
}
