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
        required this.acc_num,
        required this.subjects,
        required this.copies,
        required this.status,
        required this.pub_year,
        required this.image,
        required this.updatedAt,
        required this.createdAt,
    });

    int id;
    String title;
    String author;
    String ddc;
    String acc_num;
    String description;
    String subjects;
    String copies;
    String status;
    String pub_year;
    String image;
    DateTime updatedAt;
    DateTime createdAt;

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        description: json["description"],
        ddc: json["ddc"],
        acc_num: json["acc_num"],
        subjects: json["subjects"],
        copies: json["copies"],
        status: json["status"],
        pub_year: json["pub_year"],
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
        "acc_num": acc_num,
        "subjects": subjects,
        "copies": copies,
        "status": status,
        "pub_year": pub_year,
        "image": image,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
    };
}
