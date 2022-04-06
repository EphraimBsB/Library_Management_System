import 'package:library_magement_sys/models/book.model/book.model.dart';
import 'package:library_magement_sys/models/book.model/create.book.model.dart';
import 'package:library_magement_sys/models/book.model/single.book.model.dart';
import 'package:library_magement_sys/utils/api_base_helper.dart';

class BookService {
 static final ApiBaseHelper _helper = ApiBaseHelper();
 
  static Future<List<BookModel>?> search(searchText)async{
    var response = await _helper.get("book/search?keyword=$searchText");
    return [bookModelFromJson(response)];
      
  }

  static Future<SingleBookModel?> oneBook(id)async{
     var response = await _helper.get("book/books/$id");
      var book = singleBookModelFromJson(response);
    return book;
  }

   static Future<CreateBookModel?> create(titleTx, authorTx, descriptionTx, ddcTx, accTx, subjectsTx, copiesTx, pubyearTx, imageUrl, block, side, column, row) async {
     Map  body = {
      'title': titleTx,
      'author':authorTx,
      'description':descriptionTx,
      'ddc': ddcTx,
      'acc_num': accTx,
      'subjects': subjectsTx,
      'copies': copiesTx,
      'status': 'Available',
      'pub_year': pubyearTx,
      'image': imageUrl,
    };
    var response = await _helper.post("book",body);
      var book = createBookModelFromJson(response);
      var bookId = book.book.id;
     await createLocation(bookId, side, block, column, row);
      return book;
      
  }
  
  static Future createLocation(bookId,side, block, column, row) async {
     Map  body = {
      'bookId': '$bookId',
      'block':block,
      'side': side,
      'column': column,
      'row': row,
    };
    var response = await _helper.post("book/location",body);
      return response;
      
  }
  static Future<List<BookModel>?> listAllBooks()async{
    var response = await _helper.get("book/books");
    var books =  bookModelFromJson(response);
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

