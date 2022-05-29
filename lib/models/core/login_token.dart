// To parse this JSON data, do
//
//     final loginToken = loginTokenFromJson(jsonString);

import 'dart:convert';

LoginToken loginTokenFromJson(String str) =>
    LoginToken.fromJson(json.decode(str));

String loginTokenToJson(LoginToken data) => json.encode(data.toJson());

class LoginToken {
  LoginToken({
    this.refresh,
    this.access,
  });

  String? refresh;
  String? access;

  factory LoginToken.fromJson(Map<String, dynamic> json) => LoginToken(
        refresh: json["refresh"] == null ? null : json["refresh"],
        access: json["access"] == null ? null : json["access"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh == null ? null : refresh,
        "access": access == null ? null : access,
      };
}
