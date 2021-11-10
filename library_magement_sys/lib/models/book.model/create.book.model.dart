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
        required this.category,
        required this.copies,
        required this.status,
        required this.image,
        required this.updatedAt,
        required this.createdAt,
    });

    int id;
    String title;
    String author;
    String ddc;
    String description;
    String category;
    String copies;
    String status;
    String image;
    DateTime updatedAt;
    DateTime createdAt;

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        description: json["description"],
        ddc: json["ddc"],
        category: json["category"],
        copies: json["copies"],
        status: json["status"],
        image: json["image"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "description": description,
        "ddc": ddc,
        "category": category,
        "copies": copies,
        "status": status,
        "image": image,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
    };
}
