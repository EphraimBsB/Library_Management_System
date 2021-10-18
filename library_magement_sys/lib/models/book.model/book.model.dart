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
        required this.description,
        required this.ddc,
        required this.accNumber,
        required this.category,
        required this.copies,
        required this.status,
        required this.image,
        required this.createdAt,
        required this.location,
    });

    int id;
    String title;
    String author;
    String ddc;
    String description;
    int accNumber;
    String category;
    int copies;
    String status;
    String image;
    DateTime createdAt;
    Location location;

    factory Book.fromJson(Map<String, dynamic> json)  {
      // print('BookModel: $json');
      return Book(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        description: json["description"],
        ddc: json["ddc"],
        accNumber: json["acc_number"],
        category: json["category"],
        copies: json["copies"],
        status: json["status"],
        image: json["image"] == null ? null : json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        location: Location.fromJson(json["Location"]),
    );}

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "description": description,
        "ddc": ddc,
        "acc_number": accNumber,
        "category": category,
        "copies": copies,
        "status": status,
        "image": image == null ? null : image,
        "createdAt": createdAt.toIso8601String(),
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
