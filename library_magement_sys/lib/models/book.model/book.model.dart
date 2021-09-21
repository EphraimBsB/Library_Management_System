// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) {

 return BookModel.fromJson(json.decode(str));
  }

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
    BookModel({
        required this.books,
    });

    List<Book> books;

    factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
    };
}

class Book {
    Book({
        required this.id,
        required this.title,
        required this.author,
        required this.ddc,
        required this.accNumber,
        required this.category,
        required this.status,
        required this.image,
        required this.location,
    });

    int id;
    String title;
    String author;
    String ddc;
    int accNumber;
    String category;
    String status;
    String image;
    Location location;

    factory Book.fromJson(Map<String, dynamic> json)  {
      // print('BookModel: $json');
      return Book(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        ddc: json["ddc"],
        accNumber: json["acc_number"],
        category: json["category"],
        status: json["status"],
        image: json["image"] == null ? null : json["image"],
        location: Location.fromJson(json["Location"]),
    );}

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "ddc": ddc,
        "acc_number": accNumber,
        "category": category,
        "status": status,
        "image": image == null ? null : image,
        "Location": location.toJson(),
    };
}

class Location {
    Location({
        required this.block,
        required this.column,
        required this.section,
        required this.row,
        required this.ddc,
    });

    int block;
    int column;
    String section;
    int row;
    String ddc;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        block: json["block"],
        column: json["column"],
        section: json["section"],
        row: json["row"],
        ddc: json["ddc"],
    );

    Map<String, dynamic> toJson() => {
        "block": block,
        "column": column,
        "section": section,
        "row": row,
        "ddc": ddc,
    };
}
