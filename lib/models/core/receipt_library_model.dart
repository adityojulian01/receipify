// To parse this JSON data, do
//
//     final receiptLibrary = receiptLibraryFromJson(jsonString);

import 'dart:convert';

List<ReceiptLibrary> receiptLibraryFromJson(String str) =>
    List<ReceiptLibrary>.from(
        json.decode(str).map((x) => ReceiptLibrary.fromJson(x)));

String receiptLibraryToJson(List<ReceiptLibrary> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReceiptLibrary {
  ReceiptLibrary({
    this.id,
    this.userId,
    this.image,
    this.ingredients,
    this.created,
  });

  int? id;
  int? userId;
  String? image;
  String? ingredients;
  DateTime? created;

  factory ReceiptLibrary.fromJson(Map<String, dynamic> json) => ReceiptLibrary(
        id: json["id"] == null ? null : json["id"],
        userId: json["userID"] == null ? null : json["userID"],
        image: json["image"] == null ? null : json["image"],
        ingredients: json["ingredients"] == null ? null : json["ingredients"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "userID": userId == null ? null : userId,
        "image": image == null ? null : image,
        "ingredients": ingredients == null ? null : ingredients,
        "created": created == null ? null : created!.toIso8601String(),
      };
}
