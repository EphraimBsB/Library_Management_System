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
        required this.ddc,
        required this.category,
        required this.copies,
        required this.stock,
        required this.status,
        required this.image,
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
    Location location;

    factory SingleBook.fromJson(Map<String, dynamic> json) => SingleBook(
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
