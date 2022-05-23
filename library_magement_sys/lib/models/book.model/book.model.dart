// To parse this JSON data, do
//
//     final booksModel = booksModelFromJson(jsonString);

import 'dart:convert';

BooksModel booksModelFromJson(String str) => BooksModel.fromJson(json.decode(str));

String booksModelToJson(BooksModel data) => json.encode(data.toJson());

class BooksModel {
    BooksModel({
        required this.books,
    });

    List<Book> books;

    factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
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
        required this.pub_year,
        required this.ddc,
        required this.acc_num,
        required this.subjects,
        required this.copies,
        required this.stock,
        this.ebook,
        required this.image,
        required this.status,
        required this.shelf,
        required this.side,
        required this.column,
        required this.row,
        required this.createdAt,
    });

    int id;
    String title;
    String author;
    String description;
    String pub_year;
    String ddc;
    String acc_num;
    String subjects;
    String copies;
    String stock;
    dynamic ebook;
    String image;
    String status;
    String shelf;
    String side;
    int column;
    int row;
    DateTime createdAt;

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        description: json["description"],
        pub_year: json["pub_year"],
        ddc: json["ddc"],
        acc_num: json["acc_num"],
        subjects: json["subjects"],
        copies: json["copies"],
        stock: json["stock"],
        ebook: json["ebook"] ?? null,
        image: json["image"],
        status: json["status"],
        shelf: json["shelf"],
        side: json["side"],
        column: json["column"],
        row: json["row"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "description": description,
        "pub_year": pub_year,
        "ddc": ddc,
        "acc_num": acc_num,
        "subjects": subjects,
        "copies": copies,
        "stock": stock,
        "ebook": ebook ?? null,
        "image": image,
        "status": status,
        "shelf": shelf,
        "side": side,
        "column": column,
        "row": row,
        "createdAt": createdAt.toIso8601String(),
    };
}
