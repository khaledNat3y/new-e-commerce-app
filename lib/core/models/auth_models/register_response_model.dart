// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromMap(jsonString);

import 'dart:convert';

RegisterResponseModel loginResponseModelFromMap(String str) => RegisterResponseModel.fromMap(json.decode(str));

String loginResponseModelToMap(RegisterResponseModel data) => json.encode(data.toMap());

class RegisterResponseModel {
  String? message;
  User? user;
  String? token;

  RegisterResponseModel({
    this.message,
    this.user,
    this.token,
  });

  factory RegisterResponseModel.fromMap(Map<String, dynamic> json) => RegisterResponseModel(
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


class RegisterResponseModelError {
  final String? statusMsg;
  final String? message;

  RegisterResponseModelError({this.statusMsg, this.message});

  factory RegisterResponseModelError.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModelError(
      statusMsg: json['statusMsg'],
      message: json['message'],
    );
  }
}
