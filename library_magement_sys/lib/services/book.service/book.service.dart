import 'package:http/http.dart' as http;
import 'package:library_magement_sys/models/book.model/book.model.dart';
import 'package:library_magement_sys/models/book.model/create.book.model.dart';
import 'package:library_magement_sys/models/book.model/single.book.model.dart';
import 'package:library_magement_sys/utils/api_base_helper.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookService {
 static final ApiBaseHelper _helper = ApiBaseHelper();
 
  static Future<List<BooksModel>?> search(searchText)async{
    var response = await _helper.get("book/search?keyword=$searchText");
    return [booksModelFromJson(response)];
      
  }

  static Future<SingleBookModel?> oneBook(id)async{
     var response = await _helper.get("book/books/$id");
      var book = singleBookModelFromJson(response);
    return book;
  }

   static Future<CreateBookModel?> create(filePath, ebook, titleTx, authorTx, descriptionTx, ddcTx, accTx, subjectsTx, copiesTx, pubyearTx, imageUrl, block, side, column, row) async {
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
      var request = http.MultipartRequest("POST", Uri.parse("http://localhost:5000/book"),);
      request.headers.addAll({
          'Content-Type': 'application/json',
          'Authorization': "Bearer $token",
        },);
     Map<String, dynamic> fields = {
      'title': titleTx,
      'author':authorTx,
      'description':descriptionTx,
      'ddc': ddcTx,
      'acc_num': accTx,
      'subjects': subjectsTx,
      'copies': copiesTx,
      'pub_year': pubyearTx,
      'image': imageUrl,
      'shelf':block,
      'side': side,
      'column': column,
      'row': row,
     };

    fields.forEach((k, v) => request.fields[k] = v);
    // print('FIleService: ${filePath.name}');
    if(filePath != null ){
      request.files.add(http.MultipartFile.fromBytes('image', filePath.bytes,
      contentType: MediaType('application', 'octet-stream'),filename: filePath.name,
    ),);
    } 
    if( ebook != null){
      request.files.add(http.MultipartFile.fromBytes('ebook', ebook.bytes,
      contentType: MediaType('application', 'octet-stream'),filename: ebook.name,
    ),);
    }
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    // print('Book Creation: ${response.body}');
    var responseJson = _helper.returnResponse(response);
    print('BOOK: $responseJson');
    var book = createBookModelFromJson(responseJson);
    // print('BOOK: ${book.book.title}');
    return book;
  }
  
  static Future<List<BooksModel>?> listAllBooks()async{
    var response = await _helper.get("book/books");
    var books =  booksModelFromJson(response);
    return [books];
  }

  static Future export() async {
    var response = await _helper.get("book/export");
      return response;
      
  }

  static Future deleteBook(id)async{
     var response = await _helper.delete("book/$id");
    return response;
  }

}

