// To parse this JSON data, do
//
//     final userIngredients = userIngredientsFromJson(jsonString);

import 'dart:convert';

UserIngredients userIngredientsFromJson(String str) =>
    UserIngredients.fromJson(json.decode(str));

String userIngredientsToJson(UserIngredients data) =>
    json.encode(data.toJson());

class UserIngredients {
  UserIngredients({
    this.id,
    this.userName,
    this.emailAddress,
    this.body,
    this.updated,
    this.created,
  });

  int? id;
  String? userName;
  String? emailAddress;
  String? body;
  DateTime? updated;
  DateTime? created;

  factory UserIngredients.fromJson(Map<String, dynamic> json) =>
      UserIngredients(
        id: json["id"] ?? null,
        userName: json["userName"] ?? null,
        emailAddress: json["emailAddress"] ?? null,
        body: json["body"] ?? null,
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "userName": userName ?? null,
        "emailAddress": emailAddress ?? null,
        "body": body ?? null,
        "updated": updated == null ? null : updated?.toIso8601String(),
        "created": created == null ? null : created?.toIso8601String(),
      };
}
