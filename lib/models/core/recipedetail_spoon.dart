// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

RecipeDetail RecipeDetailFromJson(String str) =>
    RecipeDetail.fromJson(json.decode(str));

String RecipeDetailToJson(RecipeDetail data) => json.encode(data.toJson());

class RecipeDetail {
  RecipeDetail({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.lowFodmap,
    this.aggregateLikes,
    this.spoonacularScore,
    this.healthScore,
    this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
    this.imageType,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.winePairing,
    this.instructions,
    this.analyzedInstructions,
    this.originalId,
    this.spoonacularSourceUrl,
  });

  bool? vegetarian;
  bool? vegan;
  bool? glutenFree;
  bool? dairyFree;
  bool? veryHealthy;
  bool? cheap;
  bool? veryPopular;
  bool? sustainable;
  num? weightWatcherSmartPoints;
  String? gaps;
  bool? lowFodmap;
  int? aggregateLikes;
  double? spoonacularScore;
  dynamic healthScore;
  String? creditsText;
  String? license;
  String? sourceName;
  double? pricePerServing;
  List<ExtendedIngredient>? extendedIngredients;
  int? id;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  String? image;
  String? imageType;
  String? summary;
  List<String>? cuisines;
  List<String>? dishTypes;
  List<String>? diets;
  List<String>? occasions;
  WinePairing? winePairing;
  String? instructions;
  List<AnalyzedInstruction>? analyzedInstructions;
  dynamic? originalId;
  String? spoonacularSourceUrl;

  factory RecipeDetail.fromJson(Map<String, dynamic> json) => RecipeDetail(
        vegetarian: json["vegetarian"] == null ? null : json["vegetarian"],
        vegan: json["vegan"] == null ? null : json["vegan"],
        glutenFree: json["glutenFree"] == null ? null : json["glutenFree"],
        dairyFree: json["dairyFree"] == null ? null : json["dairyFree"],
        veryHealthy: json["veryHealthy"] == null ? null : json["veryHealthy"],
        cheap: json["cheap"] == null ? null : json["cheap"],
        veryPopular: json["veryPopular"] == null ? null : json["veryPopular"],
        sustainable: json["sustainable"] == null ? null : json["sustainable"],
        weightWatcherSmartPoints: json["weightWatcherSmartPoints"] == null
            ? null
            : json["weightWatcherSmartPoints"],
        gaps: json["gaps"] == null ? null : json["gaps"],
        lowFodmap: json["lowFodmap"] == null ? null : json["lowFodmap"],
        aggregateLikes:
            json["aggregateLikes"] == null ? null : json["aggregateLikes"],
        spoonacularScore:
            json["spoonacularScore"] == null ? null : json["spoonacularScore"],
        healthScore: json["healthScore"] == null ? null : json["healthScore"],
        creditsText: json["creditsText"] == null ? null : json["creditsText"],
        license: json["license"] == null ? null : json["license"],
        sourceName: json["sourceName"] == null ? null : json["sourceName"],
        pricePerServing: json["pricePerServing"] == null
            ? null
            : json["pricePerServing"].toDouble(),
        extendedIngredients: json["extendedIngredients"] == null
            ? null
            : List<ExtendedIngredient>.from(json["extendedIngredients"]
                .map((x) => ExtendedIngredient.fromJson(x))),
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        readyInMinutes:
            json["readyInMinutes"] == null ? null : json["readyInMinutes"],
        servings: json["servings"] == null ? null : json["servings"],
        sourceUrl: json["sourceUrl"] == null ? null : json["sourceUrl"],
        image: json["image"] == null ? null : json["image"],
        imageType: json["imageType"] == null ? null : json["imageType"],
        summary: json["summary"] == null ? null : json["summary"],
        cuisines: json["cuisines"] == null
            ? null
            : List<String>.from(json["cuisines"].map((x) => x)),
        dishTypes: json["dishTypes"] == null
            ? null
            : List<String>.from(json["dishTypes"].map((x) => x)),
        diets: json["diets"] == null
            ? null
            : List<String>.from(json["diets"].map((x) => x)),
        occasions: json["occasions"] == null
            ? null
            : List<String>.from(json["occasions"].map((x) => x)),
        winePairing: json["winePairing"] == null
            ? null
            : WinePairing.fromJson(json["winePairing"]),
        instructions:
            json["instructions"] == null ? null : json["instructions"],
        analyzedInstructions: json["analyzedInstructions"] == null
            ? null
            : List<AnalyzedInstruction>.from(json["analyzedInstructions"]
                .map((x) => AnalyzedInstruction.fromJson(x))),
        originalId: json["originalId"],
        spoonacularSourceUrl: json["spoonacularSourceUrl"] == null
            ? null
            : json["spoonacularSourceUrl"],
      );

  Map<String, dynamic> toJson() => {
        "vegetarian": vegetarian == null ? null : vegetarian,
        "vegan": vegan == null ? null : vegan,
        "glutenFree": glutenFree == null ? null : glutenFree,
        "dairyFree": dairyFree == null ? null : dairyFree,
        "veryHealthy": veryHealthy == null ? null : veryHealthy,
        "cheap": cheap == null ? null : cheap,
        "veryPopular": veryPopular == null ? null : veryPopular,
        "sustainable": sustainable == null ? null : sustainable,
        "weightWatcherSmartPoints":
            weightWatcherSmartPoints == null ? null : weightWatcherSmartPoints,
        "gaps": gaps == null ? null : gaps,
        "lowFodmap": lowFodmap == null ? null : lowFodmap,
        "aggregateLikes": aggregateLikes == null ? null : aggregateLikes,
        "spoonacularScore": spoonacularScore == null ? null : spoonacularScore,
        "healthScore": healthScore == null ? null : healthScore,
        "creditsText": creditsText == null ? null : creditsText,
        "license": license == null ? null : license,
        "sourceName": sourceName == null ? null : sourceName,
        "pricePerServing": pricePerServing == null ? null : pricePerServing,
        "extendedIngredients": extendedIngredients == null
            ? null
            : List<dynamic>.from(extendedIngredients!.map((x) => x.toJson())),
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "readyInMinutes": readyInMinutes == null ? null : readyInMinutes,
        "servings": servings == null ? null : servings,
        "sourceUrl": sourceUrl == null ? null : sourceUrl,
        "image": image == null ? null : image,
        "imageType": imageType == null ? null : imageType,
        "summary": summary == null ? null : summary,
        "cuisines": cuisines == null
            ? null
            : List<dynamic>.from(cuisines!.map((x) => x)),
        "dishTypes": dishTypes == null
            ? null
            : List<dynamic>.from(dishTypes!.map((x) => x)),
        "diets":
            diets == null ? null : List<dynamic>.from(diets!.map((x) => x)),
        "occasions": occasions == null
            ? null
            : List<dynamic>.from(occasions!.map((x) => x)),
        "winePairing": winePairing == null ? null : winePairing?.toJson(),
        "instructions": instructions == null ? null : instructions,
        "analyzedInstructions": analyzedInstructions == null
            ? null
            : List<dynamic>.from(analyzedInstructions!.map((x) => x.toJson())),
        "originalId": originalId,
        "spoonacularSourceUrl":
            spoonacularSourceUrl == null ? null : spoonacularSourceUrl,
      };
}

class AnalyzedInstruction {
  AnalyzedInstruction({
    this.name,
    this.steps,
  });

  String? name;
  List<Step>? steps;

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) =>
      AnalyzedInstruction(
        name: json["name"] == null ? null : json["name"],
        steps: json["steps"] == null
            ? null
            : List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "steps": steps == null
            ? null
            : List<dynamic>.from(steps!.map((x) => x.toJson())),
      };
}

class Step {
  Step({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
    this.length,
  });

  int? number;
  String? step;
  List<Ent>? ingredients;
  List<Ent>? equipment;
  Length? length;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        number: json["number"] == null ? null : json["number"],
        step: json["step"] == null ? null : json["step"],
        ingredients: json["ingredients"] == null
            ? null
            : List<Ent>.from(json["ingredients"].map((x) => Ent.fromJson(x))),
        equipment: json["equipment"] == null
            ? null
            : List<Ent>.from(json["equipment"].map((x) => Ent.fromJson(x))),
        length: json["length"] == null ? null : Length.fromJson(json["length"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "step": step == null ? null : step,
        "ingredients": ingredients == null
            ? null
            : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
        "equipment": equipment == null
            ? null
            : List<dynamic>.from(equipment!.map((x) => x.toJson())),
        "length": length == null ? null : length?.toJson(),
      };
}

class Ent {
  Ent({
    this.id,
    this.name,
    this.localizedName,
    this.image,
  });

  int? id;
  String? name;
  String? localizedName;
  String? image;

  factory Ent.fromJson(Map<String, dynamic> json) => Ent(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        localizedName:
            json["localizedName"] == null ? null : json["localizedName"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "localizedName": localizedName == null ? null : localizedName,
        "image": image == null ? null : image,
      };
}

class Length {
  Length({
    this.number,
    this.unit,
  });

  int? number;
  String? unit;

  factory Length.fromJson(Map<String, dynamic> json) => Length(
        number: json["number"] == null ? null : json["number"],
        unit: json["unit"] == null ? null : json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "unit": unit == null ? null : unit,
      };
}

class ExtendedIngredient {
  ExtendedIngredient({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.nameClean,
    this.original,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    this.measures,
  });

  int? id;
  String? aisle;
  String? image;
  Consistency? consistency;
  String? name;
  String? nameClean;
  String? original;
  String? originalName;
  double? amount;
  String? unit;
  List<String>? meta;
  Measures? measures;

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) =>
      ExtendedIngredient(
        id: json["id"] == null ? null : json["id"],
        aisle: json["aisle"] == null ? null : json["aisle"],
        image: json["image"] == null ? null : json["image"],
        consistency: json["consistency"] == null
            ? null
            : consistencyValues.map[json["consistency"]],
        name: json["name"] == null ? null : json["name"],
        nameClean: json["nameClean"] == null ? null : json["nameClean"],
        original: json["original"] == null ? null : json["original"],
        originalName:
            json["originalName"] == null ? null : json["originalName"],
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
        unit: json["unit"] == null ? null : json["unit"],
        meta: json["meta"] == null
            ? null
            : List<String>.from(json["meta"].map((x) => x)),
        measures: json["measures"] == null
            ? null
            : Measures.fromJson(json["measures"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "aisle": aisle == null ? null : aisle,
        "image": image == null ? null : image,
        "consistency":
            consistency == null ? null : consistencyValues.reverse[consistency],
        "name": name == null ? null : name,
        "nameClean": nameClean == null ? null : nameClean,
        "original": original == null ? null : original,
        "originalName": originalName == null ? null : originalName,
        "amount": amount == null ? null : amount,
        "unit": unit == null ? null : unit,
        "meta": meta == null ? null : List<dynamic>.from(meta!.map((x) => x)),
        "measures": measures == null ? null : measures?.toJson(),
      };
}

enum Consistency { SOLID, LIQUID }

final consistencyValues =
    EnumValues({"liquid": Consistency.LIQUID, "solid": Consistency.SOLID});

class Measures {
  Measures({
    this.us,
    this.metric,
  });

  Metric? us;
  Metric? metric;

  factory Measures.fromJson(Map<String, dynamic> json) => Measures(
        us: json["us"] == null ? null : Metric.fromJson(json["us"]),
        metric: json["metric"] == null ? null : Metric.fromJson(json["metric"]),
      );

  Map<String, dynamic> toJson() => {
        "us": us == null ? null : us?.toJson(),
        "metric": metric == null ? null : metric?.toJson(),
      };
}

class Metric {
  Metric({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  double? amount;
  String? unitShort;
  String? unitLong;

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
        unitShort: json["unitShort"] == null ? null : json["unitShort"],
        unitLong: json["unitLong"] == null ? null : json["unitLong"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount == null ? null : amount,
        "unitShort": unitShort == null ? null : unitShort,
        "unitLong": unitLong == null ? null : unitLong,
      };
}

class WinePairing {
  WinePairing({
    this.pairedWines,
    this.pairingText,
    this.productMatches,
  });

  List<String>? pairedWines;
  String? pairingText;
  List<ProductMatch>? productMatches;

  factory WinePairing.fromJson(Map<String, dynamic> json) => WinePairing(
        pairedWines: json["pairedWines"] == null
            ? null
            : List<String>.from(json["pairedWines"].map((x) => x)),
        pairingText: json["pairingText"] == null ? null : json["pairingText"],
        productMatches: json["productMatches"] == null
            ? null
            : List<ProductMatch>.from(
                json["productMatches"].map((x) => ProductMatch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pairedWines": pairedWines == null
            ? null
            : List<dynamic>.from(pairedWines!.map((x) => x)),
        "pairingText": pairingText == null ? null : pairingText,
        "productMatches": productMatches == null
            ? null
            : List<dynamic>.from(productMatches!.map((x) => x.toJson())),
      };
}

class ProductMatch {
  ProductMatch({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.averageRating,
    this.ratingCount,
    this.score,
    this.link,
  });

  int? id;
  dynamic? title;
  String? description;
  String? price;
  String? imageUrl;
  double? averageRating;
  num? ratingCount;
  double? score;
  String? link;

  factory ProductMatch.fromJson(Map<String, dynamic> json) => ProductMatch(
        id: json["id"] == null ? null : json["id"],
        title: json["title"],
        description: json["description"] == null ? null : json["description"],
        price: json["price"] == null ? null : json["price"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        averageRating: json["averageRating"] == null
            ? null
            : json["averageRating"].toDouble(),
        ratingCount: json["ratingCount"] == null ? null : json["ratingCount"],
        score: json["score"] == null ? null : json["score"].toDouble(),
        link: json["link"] == null ? null : json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title,
        "description": description == null ? null : description,
        "price": price == null ? null : price,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "averageRating": averageRating == null ? null : averageRating,
        "ratingCount": ratingCount == null ? null : ratingCount,
        "score": score == null ? null : score,
        "link": link == null ? null : link,
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
