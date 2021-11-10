// To parse this JSON data, do
//
//     final singleLoanModel = singleLoanModelFromJson(jsonString);

import 'dart:convert';

SingleLoanModel singleLoanModelFromJson(String str) => SingleLoanModel.fromJson(json.decode(str));

String singleLoanModelToJson(SingleLoanModel data) => json.encode(data.toJson());

class SingleLoanModel {
    SingleLoanModel({
        required this.loans,
    });

    SingleLoans loans;

    factory SingleLoanModel.fromJson(Map<String, dynamic> json) => SingleLoanModel(
        loans: SingleLoans.fromJson(json["loans"]),
    );

    Map<String, dynamic> toJson() => {
        "loans": loans.toJson(),
    };
}

class SingleLoans {
    SingleLoans({
        required this.id,
        required this.userId,
        required this.bookId,
        required this.issueDate,
        required this.dueDate,
        this.returnDate,
        required this.status,
        required this.updatedAt,
        required this.book,
        required this.user,
    });

    int id;
    int userId;
    int bookId;
    DateTime issueDate;
    DateTime dueDate;
    dynamic returnDate;
    String status;
    DateTime updatedAt;
    Book book;
    User user;

    factory SingleLoans.fromJson(Map<String, dynamic> json) => SingleLoans(
        id: json["id"],
        userId: json["userId"],
        bookId: json["bookId"],
        issueDate: DateTime.parse(json["issueDate"]),
        dueDate: DateTime.parse(json["dueDate"]),
        returnDate: json["returnDate"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        book: Book.fromJson(json["Book"]),
        user: User.fromJson(json["User"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "bookId": bookId,
        "issueDate": issueDate.toIso8601String(),
        "dueDate": dueDate.toIso8601String(),
        "returnDate": returnDate,
        "status": status,
        "updatedAt": updatedAt.toIso8601String(),
        "Book": book.toJson(),
        "User": user.toJson(),
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
        required this.status,
        required this.image,
    });

    int id;
    String title;
    String author;
    String description;
    String ddc;
    String category;
    String status;
    String image;

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        description: json["description"],
        ddc: json["ddc"],
        category: json["category"],
        status: json["status"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "description": description,
        "ddc": ddc,
        "category": category,
        "status": status,
        "image": image,
    };
}

class User {
    User({
        required this.id,
        required this.name,
        required this.lastName,
        required this.rollNumber,
        required this.course,
        required this.email,
        required this.phoneNumber,
    });

    int id;
    String name;
    String lastName;
    String rollNumber;
    String course;
    String email;
    String phoneNumber;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        rollNumber: json["roll_number"],
        course: json["course"],
        email: json["email"],
        phoneNumber: json["phone_number"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "roll_number": rollNumber,
        "course": course,
        "email": email,
        "phone_number": phoneNumber,
    };
}
