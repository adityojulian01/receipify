// To parse this JSON data, do
//
//     final loginModal = loginModalFromJson(jsonString);

import 'dart:convert';

LoginModal loginModalFromJson(String str) =>
    LoginModal.fromJson(json.decode(str));

String loginModalToJson(LoginModal data) => json.encode(data.toJson());

class LoginModal {
  LoginModal({
    this.username,
    this.email,
    this.password,
  });

  String? username;
  String? email;
  String? password;

  factory LoginModal.fromJson(Map<String, dynamic> json) => LoginModal(
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
      };
}
