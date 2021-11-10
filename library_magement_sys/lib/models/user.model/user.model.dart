// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.users,
    });

    List<User> users;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
    };
}

class User {
    User({
        required this.id,
        required this.name,
        required this.lastName,
        required this.rollNumber,
        required this.course,
        required this.degree,
        required this.email,
        required this.phoneNumber,
        required this.password,
        required this.role,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String name;
    String lastName;
    String rollNumber;
    String course;
    String degree;
    String email;
    String phoneNumber;
    String password;
    String role;
    DateTime createdAt;
    DateTime updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        rollNumber: json["roll_number"],
        course: json["course"],
        degree: json["degree"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        password: json["password"],
        role: json["role"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "roll_number": rollNumber,
        "course": course,
        "degree": degree,
        "email": email,
        "phone_number": phoneNumber,
        "password": password,
        "role": role,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
