// To parse this JSON data, do
//
//     final singleBookModel = singleBookModelFromJson(jsonString);

import 'dart:convert';

SingleBookModel singleBookModelFromJson(String str) => SingleBookModel.fromJson(json.decode(str));

String singleBookModelToJson(SingleBookModel data) => json.encode(data.toJson());

class SingleBookModel {
    SingleBookModel({
        required this.book,
    });

    SingleBook book;

    factory SingleBookModel.fromJson(Map<String, dynamic> json) => SingleBookModel(
        book: SingleBook.fromJson(json["book"]),
    );

    Map<String, dynamic> toJson() => {
        "book": book.toJson(),
    };
}

class SingleBook {
    SingleBook({
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

    factory SingleBook.fromJson(Map<String, dynamic> json) => SingleBook(
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
    };
}
