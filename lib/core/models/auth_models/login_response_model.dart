// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromMap(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromMap(String str) => LoginResponseModel.fromMap(json.decode(str));

String loginResponseModelToMap(LoginResponseModel data) => json.encode(data.toMap());

class LoginResponseModel {
  String? message;
  User? user;
  String? token;

  LoginResponseModel({
    this.message,
    this.user,
    this.token,
  });

  factory LoginResponseModel.fromMap(Map<String, dynamic> json) => LoginResponseModel(
    message: json["message"],
    user: json["user"] == null ? null : User.fromMap(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "user": user?.toMap(),
    "token": token,
  };
}

class User {
  String? name;
  String? email;
  String? role;

  User({
    this.name,
    this.email,
    this.role,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    role: json["role"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "email": email,
    "role": role,
  };
}
