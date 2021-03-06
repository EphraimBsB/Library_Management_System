// To parse this JSON data, do
//
//     final AllLoansModel = AllLoansModelFromJson(jsonString);

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
        required this.issueDate,
        required this.dueDate,
        required this.returnDate,
        required this.status,
        required this.book,
        required this.user,
    });

    int id;
    int bookId;
    int userId;
    DateTime issueDate;
    DateTime dueDate;
    DateTime? returnDate;
    String status;
    Book book;
    User user;

    factory AllLoan.fromJson(Map<String, dynamic> json) => AllLoan(
        id: json["id"],
        userId: json["userId"],
        bookId: json["bookId"],
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
        "issueDate": issueDate.toIso8601String(),
        "dueDate": dueDate.toIso8601String(),
         "returnDate": returnDate == null ? null : returnDate!.toIso8601String(),
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
        required this.ddc,
        required this.accNumber,
        required this.category,
        required this.status,
        required this.image,
    });

    int id;
    String title;
    String author;
    String ddc;
    int accNumber;
    String category;
    String status;
    String image;

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        ddc: json["ddc"],
        accNumber: json["acc_number"],
        category: json["category"],
        status: json["status"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "ddc": ddc,
        "acc_number": accNumber,
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
