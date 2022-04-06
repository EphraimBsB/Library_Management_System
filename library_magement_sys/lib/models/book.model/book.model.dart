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
        required this.acc_num,
        required this.subjects,
        required this.copies,
        required this.stock,
        required this.status,
        required this.pub_year,
        required this.image,
        required this.createdAt,
        required this.location,
    });

    int id;
    String title;
    String author;
    String description;
    String ddc;
    String acc_num;
    String subjects;
    String copies;
    String stock;
    String status;
    String pub_year;
    String image;
    DateTime createdAt;
    Location location;

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        description: json["description"],
        ddc: json["ddc"],
        acc_num: json["acc_num"],
        subjects: json["subjects"],
        copies: json["copies"],
        stock: json["stock"],
        status: json["status"],
        pub_year: json["pub_year"],
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
        "acc_num": acc_num,
        "subjects": subjects,
        "copies": copies,
        "stock": stock,
        "status": status,
        "pub_year": pub_year,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "Location": location.toJson(),
    };
}

class Location {
    Location({
        required this.shelf,
        required this.side,
        required this.column,
        required this.section,
        required this.row,
        required this.ddc,
    });

    String shelf;
    String side;
    int column;
    String section;
    int row;
    String ddc;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        shelf: json["shelf"],
        side: json["side"],
        column: json["column"],
        section: json["section"],
        row: json["row"],
        ddc: json["ddc"],
    );

    Map<String, dynamic> toJson() => {
        "shelf": shelf,
        "side": side,
        "column": column,
        "section": section,
        "row": row,
        "ddc": ddc,
    };
}
