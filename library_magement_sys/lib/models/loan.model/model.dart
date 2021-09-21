// To parse this JSON data, do
//
//     final loanModel = loanModelFromJson(jsonString);

import 'dart:convert';

LoanModel loanModelFromJson(String str) => LoanModel.fromJson(json.decode(str));

String loanModelToJson(LoanModel data) => json.encode(data.toJson());

class LoanModel {
    LoanModel({
        required this.loan,
    });

    Loan loan;

    factory LoanModel.fromJson(Map<String, dynamic> json) => LoanModel(
        loan: Loan.fromJson(json["loan"]),
    );

    Map<String, dynamic> toJson() => {
        "loan": loan.toJson(),
    };
}

class Loan {
    Loan({
        required this.id,
        required this.userId,
        required this.bookId,
        required this.issueDate,
        required this.dueDate,
        this.returnDate,
        required this.status,
        required this.updatedAt,
        required this.createdAt,
    });

    int id;
    String userId;
    String bookId;
    DateTime issueDate;
    DateTime dueDate;
    dynamic returnDate;
    String status;
    DateTime updatedAt;
    DateTime createdAt;

    factory Loan.fromJson(Map<String, dynamic> json) => Loan(
        id: json["id"],
        userId: json["userId"],
        bookId: json["bookId"],
        issueDate: DateTime.parse(json["issueDate"]),
        dueDate: DateTime.parse(json["dueDate"]),
        returnDate: json["returnDate"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
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
        "createdAt": createdAt.toIso8601String(),
    };
}
