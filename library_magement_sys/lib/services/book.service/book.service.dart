import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:library_magement_sys/models/book.model/book.model.dart';
import 'package:library_magement_sys/models/book.model/create.book.model.dart';
import 'package:library_magement_sys/models/book.model/single.book.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookService {
 static var client = http.Client();
  
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

   static Future<CreateBookModel?> create(titleTx, authorTx, ddcTx, accNumberTx, categoryTx, imageUrl,block, column, row) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
     Map  body = {
      'title': titleTx,
      'author':authorTx,
      'ddc': ddcTx,
      'acc_number': accNumberTx,
      'category': categoryTx,
      'status': 'available',
      'image': imageUrl,
    };

    var response = await client.post(Uri.parse("http://localhost:5000/book"),headers:{'Access-Control-Allow-Origin': '*', HttpHeaders.authorizationHeader:"Bearer $token"}, body: body);
    print("create Response: ${response.body}");
    if(response.statusCode == 201){
      String jsonString = response.body;
      var book = createBookModelFromJson(jsonString);
      var bookId = book.book.id;
      createLocation(bookId, block, column, row);
      print("CreatedBook:${book}");

      return book;
      
    }else{
      return null;
    }
  }
  
  static Future createLocation(bookId,block, column, row) async {
     Map  body = {
      'bookId': '$bookId',
      'block':block,
      'column': column,
      'row': row,
    };

    var response = await client.post(Uri.parse("http://localhost:5000/book/location"),headers:{'Access-Control-Allow-Origin': '*',}, body: body);
    if(response.statusCode == 201){
      String jsonString = response.body;
      print("locationResponse: $jsonString");
      return jsonString;
      
    }else{
      return null;
    }
  }
  static Future<List<BookModel>?> allBooks(titleTx, authorTx, ddcTx, accNumberTx, categoryTx, imageUrl, block, column, row)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    await create(titleTx, authorTx, ddcTx, accNumberTx, categoryTx, imageUrl, block, column, row);
    var response = await client.get(Uri.parse("http://localhost:5000/book/books"), headers: {'Access-Control-Allow-Origin': '*', HttpHeaders.authorizationHeader:"Bearer $token"});
    if(response.statusCode == 200){
      String jsonString = response.body;
     
    var books =  bookModelFromJson(jsonString);
    print('All Books: ${books.books.first}');
    return [books];
      
    }else{
      return null;
    }
  }

  static Future<List<BookModel>?> listAllBooks()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var response = await client.get(Uri.parse("http://localhost:5000/book/books"), headers: {'Access-Control-Allow-Origin': '*',  HttpHeaders.authorizationHeader:"Bearer $token"});
    if(response.statusCode == 200){
      String jsonString = response.body;
     
    var books =  bookModelFromJson(jsonString);
    print('All Books: ${books.books.first}');
    return [books];
      
    }else{
      return null;
    }
  }

}

