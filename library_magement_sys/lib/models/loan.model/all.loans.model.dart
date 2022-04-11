// To parse this JSON data, do
//
//     final allLoansModel = allLoansModelFromJson(jsonString);

import 'dart:convert';

AllLoansModel allLoansModelFromJson(String str) => AllLoansModel.fromJson(json.decode(str));

String allLoansModelToJson(AllLoansModel data) => json.encode(data.toJson());

class AllLoansModel {
    AllLoansModel({
        required this.loans,
    });

    List<AllLoan> loans;

    factory AllLoansModel.fromJson(Map<String, dynamic> json) => AllLoansModel(
        loans: List<AllLoan>.from(json["loans"].map((x) => AllLoan.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "loans": List<dynamic>.from(loans.map((x) => x.toJson())),
    };
}

class AllLoan {
    AllLoan({
        required this.id,
        required this.userId,
        required this.bookId,
        required this.bookAccNo,
        required this.issueDate,
        required this.dueDate,
        this.returnDate,
        required this.status,
        required this.book,
        required this.user
    });

    int id;
    int userId;
    int bookId;
    String bookAccNo;
    DateTime issueDate;
    DateTime dueDate;
    dynamic returnDate;
    String status;
    Book book;
    User user;

    factory AllLoan.fromJson(Map<String, dynamic> json) => AllLoan(
        id: json["id"],
        userId: json["userId"],
        bookId: json["bookId"],
        bookAccNo: json["bookAccNo"],
        issueDate: DateTime.parse(json["issueDate"]),
        dueDate: DateTime.parse(json["dueDate"]),
        returnDate: json["returnDate"] == null ? null : DateTime.parse(json["returnDate"]),
        status: json["status"],
        book: Book.fromJson(json["Book"]),
        user: User.fromJson(json["User"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "bookId": bookId,
        "bookAccNo": bookAccNo,
        "issueDate": issueDate.toIso8601String(),
        "dueDate": dueDate.toIso8601String(),
        "returnDate": returnDate == null ? null : returnDate.toIso8601String(),
        "status": status,
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
        required this.subjects,
        required this.copies,
        required this.status,
        required this.image,
    });

    int id;
    String title;
    String author;
    String description;
    String ddc;
    String subjects;
    String copies;
    String status;
    String image;

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        description: json["description"],
        ddc: json["ddc"],
        subjects: json["subjects"],
        copies: json["copies"],
        status: json["status"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "description": description,
        "ddc": ddc,
        "subjects": subjects,
        "copies": copies,
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
        required this.email,
        required this.phoneNumber,
    });

    int id;
    String name;
    String lastName;
    String rollNumber;
    String email;
    String phoneNumber;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        rollNumber: json["roll_number"],
        email: json["email"],
        phoneNumber: json["phone_number"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "roll_number": rollNumber,
        "email": email,
        "phone_number": phoneNumber,
    };
}
