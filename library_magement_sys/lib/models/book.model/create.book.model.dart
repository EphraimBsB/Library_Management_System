// To parse this JSON data, do
//
//     final createBookModel = createBookModelFromJson(jsonString);

import 'dart:convert';

CreateBookModel createBookModelFromJson(String str) => CreateBookModel.fromJson(json.decode(str));

String createBookModelToJson(CreateBookModel data) => json.encode(data.toJson());

class CreateBookModel {
    CreateBookModel({
        required this.message,
        required this.book,
    });

    String message;
    Book book;

    factory CreateBookModel.fromJson(Map<String, dynamic> json) => CreateBookModel(
        message: json["message"],
        book: Book.fromJson(json["book"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "book": book.toJson(),
    };
}

class Book {
    Book({
        required this.id,
        required this.title,
        required this.author,
        required this.description,
        required this.ddc,
        required this.accNum,
        required this.copies,
        required this.stock,
        required this.subjects,
        required this.pubYear,
        required this.image,
        this.ebook,
        required this.shelf,
        required this.side,
        required this.column,
        required this.row,
        required this.updatedAt,
        required this.createdAt,
    });

    int id;
    String title;
    String author;
    String description;
    String ddc;
    String accNum;
    String copies;
    String stock;
    String subjects;
    String pubYear;
    String image;
    dynamic ebook;
    String shelf;
    String side;
    String column;
    String row;
    DateTime updatedAt;
    DateTime createdAt;

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        description: json["description"],
        ddc: json["ddc"],
        accNum: json["acc_num"],
        copies: json["copies"],
        stock: json["stock"],
        subjects: json["subjects"],
        pubYear: json["pub_year"],
        image: json["image"],
        ebook: json["ebook"] ?? null,
        shelf: json["shelf"],
        side: json["side"],
        column: json["column"],
        row: json["row"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "description": description,
        "ddc": ddc,
        "acc_num": accNum,
        "copies": copies,
        "stock": stock,
        "subjects": subjects,
        "pub_year": pubYear,
        "image": image,
        "ebook": ebook ?? null,
        "shelf": shelf,
        "side": side,
        "column": column,
        "row": row,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
    };
}
