// To parse this JSON data, do
//
//     final studentLoanns = studentLoannsFromJson(jsonString);

import 'dart:convert';

StudentLoanns studentLoannsFromJson(String str) => StudentLoanns.fromJson(json.decode(str));

String studentLoannsToJson(StudentLoanns data) => json.encode(data.toJson());

class StudentLoanns {
    StudentLoanns({
        required this.loans,
    });

    Loans loans;

    factory StudentLoanns.fromJson(Map<String, dynamic> json) => StudentLoanns(
        loans: Loans.fromJson(json["loans"]),
    );

    Map<String, dynamic> toJson() => {
        "loans": loans.toJson(),
    };
}

class Loans {
    Loans({
        required this.user,
        required this.loans,
    });

    User user;
    List<Loan> loans;

    factory Loans.fromJson(Map<String, dynamic> json) => Loans(
        user: User.fromJson(json["user"]),
        loans: List<Loan>.from(json["Loans"].map((x) => Loan.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "Loans": List<dynamic>.from(loans.map((x) => x.toJson())),
    };
}

class Loan {
    Loan({
        required this.id,
        required this.userId,
        required this.bookId,
        required this.bookAccNo,
        required this.issueDate,
        required this.dueDate,
        required this.returnDate,
        required this.status,
        required this.book,
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

    factory Loan.fromJson(Map<String, dynamic> json) => Loan(
        id: json["id"],
        userId: json["userId"],
        bookId: json["bookId"],
        bookAccNo: json["bookAccNo"],
        issueDate: DateTime.parse(json["issueDate"]),
        dueDate: DateTime.parse(json["dueDate"]),
        returnDate: json["returnDate"] == null ? null : DateTime.parse(json["returnDate"]),
        status: json["status"],
        book: Book.fromJson(json["Book"]),
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
    };
}

class Book {
    Book({
        required this.id,
        required this.title,
        required this.author,
        required this.ddc,
        required this.subjects,
        required this.status,
        required this.image,
    });

    int id;
    String title;
    String author;
    String ddc;
    String subjects;
    String status;
    String image;

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        ddc: json["ddc"],
        subjects: json["subjects"],
        status: json["status"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "ddc": ddc,
        "subjects": subjects,
        "status": status,
        "image": image,
    };
}

class User {
    User({
        required this.id,
        required this.name,
        required this.lastName,
        required this.course,
        required this.rollNumber,
        required this.email,
        required this.phoneNumber,
    });

    int id;
    String name;
    String lastName;
    String course;
    String rollNumber;
    String email;
    String phoneNumber;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        course: json["course"],
        rollNumber: json["roll_number"],
        email: json["email"],
        phoneNumber: json["phone_number"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "course": course,
        "roll_number": rollNumber,
        "email": email,
        "phone_number": phoneNumber,
    };
}
