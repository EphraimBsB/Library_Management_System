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
  static Future<List<BookModel>?> listAllBooks()async{
      var response = await _helper.get("book/books");
     
    var books =  bookModelFromJson(response);
    print('All Books: ${books.books.first}');
    return [books];
  }

  static Future export() async {
    var response = await _helper.get("book/export");
      return response;
      
  }

}

