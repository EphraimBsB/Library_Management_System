import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:library_magement_sys/models/book.model/book.model.dart';
import 'package:library_magement_sys/models/book.model/create.book.model.dart';
import 'package:library_magement_sys/models/book.model/single.book.model.dart';
import 'package:library_magement_sys/utils/api_base_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookService {
 static var client = http.Client();
 static final ApiBaseHelper _helper = ApiBaseHelper();
  static Future<List<BookModel>?> search(searchText)async{
    var response = await client.get(Uri.parse("http://localhost:5000/book/search?keyword=$searchText"), headers: {'Access-Control-Allow-Origin': '*'});

    if(response.statusCode == 200){
      String jsonString = response.body;
     
    return [bookModelFromJson(jsonString)];
      
    }else{
      return null;
    }
  }

  static Future<SingleBookModel?> oneBook(id)async{
    var response = await client.get(Uri.parse("http://localhost:5000/book/books/$id"), headers: {'Access-Control-Allow-Origin': '*'});

    if(response.statusCode == 200){
      String jsonString = response.body;
     
    
    var book = singleBookModelFromJson(jsonString);
    return book;
      
    }else{
      return null;
    }
  }

   static Future<CreateBookModel?> create(titleTx, authorTx, descriptionTx, ddcTx, accNumberTx, categoryTx, copiesTx, imageUrl, block, column, row) async {
     Map  body = {
      'title': titleTx,
      'author':authorTx,
      'description':descriptionTx,
      'ddc': ddcTx,
      'acc_number': accNumberTx,
      'category': categoryTx,
      'copies': copiesTx,
      'status': 'Available',
      'image': imageUrl,
    };
    var response = await _helper.post("book",body);
      var book = createBookModelFromJson(response);
      var bookId = book.book.id;
     await createLocation(bookId, block, column, row);
      print("CreatedBook:$book");

      return book;
      
  }
  
  static Future createLocation(bookId,block, column, row) async {
     Map  body = {
      'bookId': '$bookId',
      'block':block,
      'column': column,
      'row': row,
    };
    var response = await _helper.post("book/location",body);
      print("locationResponse: $response");
      return response;
      
  }
  // static Future<List<BookModel>?> allBooks(titleTx, authorTx, descriptionTx, ddcTx, accNumberTx, categoryTx, copiesTx, imageUrl, block, column, row)async{
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var token = sharedPreferences.getString("token");
  //   await create(titleTx, authorTx, descriptionTx, ddcTx, accNumberTx, categoryTx, copiesTx, imageUrl, block, column, row);
  //   var response = await _helper.get("book/books");
  //   var books =  bookModelFromJson(response);
  //   print('All Books: ${books.books.first}');
  //   return [books];
      
  // }

  static Future<List<BookModel>?> listAllBooks()async{
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var token = sharedPreferences.getString("token");
      var response = await _helper.get("book/books");
      // print('ServiceRespose: $response');
     
    var books =  bookModelFromJson(response);
    print('All Books: ${books.books.first}');
    return [books];
      
    
  }

}

