// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

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
        required this.category,
        required this.copies,
        required this.stock,
        required this.status,
        required this.image,
        required this.createdAt,
        required this.location,
    });

    int id;
    String title;
    String author;
    String description;
    String ddc;
    String category;
    String copies;
    String stock;
    String status;
    String image;
    DateTime createdAt;
    Location location;

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        description: json["description"],
        ddc: json["ddc"],
        category: json["category"],
        copies: json["copies"],
        stock: json["stock"],
        status: json["status"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        location: Location.fromJson(json["Location"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "description": description,
        "ddc": ddc,
        "category": category,
        "copies": copies,
        "stock": stock,
        "status": status,
        "image": image,
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
