// To parse this JSON data, do
//
//     final recipe = recipeFromJson(jsonString);

import 'dart:convert';

List<Recipe> recipeFromJson(String str) =>
    List<Recipe>.from(json.decode(str).map((x) => Recipe.fromJson(x)));

String recipeToJson(List<Recipe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recipe {
  Recipe({
    this.id,
    this.title,
    this.image,
    this.imageType,
    this.usedIngredientCount,
    this.missedIngredientCount,
    this.missedIngredients,
    this.usedIngredients,
    this.unusedIngredients,
    this.likes,
  });

  int? id;
  String? title;
  String? image;
  ImageType? imageType;
  int? usedIngredientCount;
  int? missedIngredientCount;
  List<SedIngredient>? missedIngredients;
  List<SedIngredient>? usedIngredients;
  List<SedIngredient>? unusedIngredients;
  int? likes;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        image: json["image"] == null ? null : json["image"],
        imageType: json["imageType"] == null
            ? null
            : imageTypeValues.map[json["imageType"]],
        usedIngredientCount: json["usedIngredientCount"] == null
            ? null
            : json["usedIngredientCount"],
        missedIngredientCount: json["missedIngredientCount"] == null
            ? null
            : json["missedIngredientCount"],
        missedIngredients: json["missedIngredients"] == null
            ? null
            : List<SedIngredient>.from(json["missedIngredients"]
                .map((x) => SedIngredient.fromJson(x))),
        usedIngredients: json["usedIngredients"] == null
            ? null
            : List<SedIngredient>.from(
                json["usedIngredients"].map((x) => SedIngredient.fromJson(x))),
        unusedIngredients: json["unusedIngredients"] == null
            ? null
            : List<SedIngredient>.from(json["unusedIngredients"]
                .map((x) => SedIngredient.fromJson(x))),
        likes: json["likes"] == null ? null : json["likes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "image": image == null ? null : image,
        "imageType":
            imageType == null ? null : imageTypeValues.reverse[imageType],
        "usedIngredientCount":
            usedIngredientCount == null ? null : usedIngredientCount,
        "missedIngredientCount":
            missedIngredientCount == null ? null : missedIngredientCount,
        "missedIngredients": missedIngredients == null
            ? null
            : List<dynamic>.from(missedIngredients!.map((x) => x.toJson())),
        "usedIngredients": usedIngredients == null
            ? null
            : List<dynamic>.from(usedIngredients!.map((x) => x.toJson())),
        "unusedIngredients": unusedIngredients == null
            ? null
            : List<dynamic>.from(unusedIngredients!.map((x) => x.toJson())),
        "likes": likes == null ? null : likes,
      };
}

enum ImageType { JPG }

final imageTypeValues = EnumValues({"jpg": ImageType.JPG});

class SedIngredient {
  SedIngredient({
    this.id,
    this.amount,
    this.unit,
    this.unitLong,
    this.unitShort,
    this.aisle,
    this.name,
    this.original,
    this.originalName,
    this.meta,
    this.extendedName,
    this.image,
  });

  int? id;
  double? amount;
  String? unit;
  String? unitLong;
  String? unitShort;
  String? aisle;
  String? name;
  String? original;
  String? originalName;
  List<String>? meta;
  String? extendedName;
  String? image;

  factory SedIngredient.fromJson(Map<String, dynamic> json) => SedIngredient(
        id: json["id"] == null ? null : json["id"],
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
        unit: json["unit"] == null ? null : json["unit"],
        unitLong: json["unitLong"] == null ? null : json["unitLong"],
        unitShort: json["unitShort"] == null ? null : json["unitShort"],
        aisle: json["aisle"] == null ? null : json["aisle"],
        name: json["name"] == null ? null : json["name"],
        original: json["original"] == null ? null : json["original"],
        originalName:
            json["originalName"] == null ? null : json["originalName"],
        meta: json["meta"] == null
            ? null
            : List<String>.from(json["meta"].map((x) => x)),
        extendedName:
            json["extendedName"] == null ? null : json["extendedName"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "amount": amount == null ? null : amount,
        "unit": unit == null ? null : unit,
        "unitLong": unitLong == null ? null : unitLong,
        "unitShort": unitShort == null ? null : unitShort,
        "aisle": aisle == null ? null : aisle,
        "name": name == null ? null : name,
        "original": original == null ? null : original,
        "originalName": originalName == null ? null : originalName,
        "meta": meta == null ? null : List<dynamic>.from(meta!.map((x) => x)),
        "extendedName": extendedName == null ? null : extendedName,
        "image": image == null ? null : image,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
