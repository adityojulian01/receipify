// To parse this JSON data, do
//
//     final recipeResult = recipeResultFromJson(jsonString);

import 'dart:convert';

RecipeResult recipeResultFromJson(String str) =>
    RecipeResult.fromJson(json.decode(str));

String recipeResultToJson(RecipeResult data) => json.encode(data.toJson());

class RecipeResult {
  RecipeResult({
    this.results,
    this.offset,
    this.number,
    this.totalResults,
  });

  List<Result>? results;
  int? offset;
  int? number;
  int? totalResults;

  factory RecipeResult.fromJson(Map<String, dynamic> json) => RecipeResult(
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        offset: json["offset"] == null ? null : json["offset"],
        number: json["number"] == null ? null : json["number"],
        totalResults:
            json["totalResults"] == null ? null : json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "offset": offset == null ? null : offset,
        "number": number == null ? null : number,
        "totalResults": totalResults == null ? null : totalResults,
      };
}

class Result {
  Result({
    this.id,
    this.title,
    this.image,
    this.imageType,
  });

  int? id;
  String? title;
  String? image;
  ImageType? imageType;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        image: json["image"] == null ? null : json["image"],
        imageType: json["imageType"] == null
            ? null
            : imageTypeValues.map[json["imageType"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "image": image == null ? null : image,
        "imageType":
            imageType == null ? null : imageTypeValues.reverse[imageType],
      };
}

enum ImageType { JPG }

final imageTypeValues = EnumValues({"jpg": ImageType.JPG});

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
