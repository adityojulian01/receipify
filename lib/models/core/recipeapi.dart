// CLASS - RECIPE
class RecipeAPI {
  late String? name;
  late String? images;
  late int? servings;
  late String? totalTime;
  late String? description;
  late List<String>? steps;
  late List<Ingredients>? ingredients;
  late List<IngredientsList>? ingredientsList;
  // List<Ingredient> ingredients;
  // List<TutorialStep> tutorial;

  RecipeAPI({
    required this.name,
    required this.images,
    required this.servings,
    required this.totalTime,
    required this.description,
    required this.steps,
    required this.ingredients,
    required this.ingredientsList,
    // required this.tutorial,
  });

  factory RecipeAPI.fromJson(dynamic json) {
    return RecipeAPI(
      name: json['details']['name'] == null
          ? null
          : json['details']['name'].toString(), // Setting
      images: json['details']['images'] == null
          ? null
          : json['details']['images'][0]['hostedLargeUrl'].toString(),
      servings: json['details']['numberOfServings'] == null
          ? null
          : json['details']['numberOfServings'],
      totalTime: json['details']['totalTime'] == null
          ? null
          : json['details']['totalTime'].toString(),
      description: json['description'] == null
          ? null
          : json['description']['text'].toString(),
      steps: json['preparationSteps'] == null
          ? null
          : List<String>.from(
              json['preparationSteps'].map((x) => x),
            ),
      ingredients: json['ingredientLines'] == null
          ? null
          : List<Ingredients>.from(
              json['ingredientLines'].map(
                (x) => Ingredients.fromJson(x),
              ),
            ),
      ingredientsList: json['ingredientLines'] == null
          ? null
          : List<IngredientsList>.from(
              json['ingredientLines'].map(
                (x) => IngredientsList.fromJson(x),
              ),
            ),
    );
  }
  contains(String lowerCase) {}

  static List<RecipeAPI> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return RecipeAPI.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $images, serving: $servings, totalTime: $totalTime}';
  }

  static getRecipeDetail(int id) {}
}

class Ingredients {
  Ingredients({
    this.wholeLine,
    this.item,
  });

  String? wholeLine;
  String? item;

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(wholeLine: json['wholeLine'], item: json['ingredient']);
  }

  @override
  String toString() {
    return 'Ingredients {ingredients: $wholeLine, item: $item}';
  }
}

class IngredientsList {
  IngredientsList({this.ingredient});

  String? ingredient;

  factory IngredientsList.fromJson(Map<String, dynamic> json) {
    return IngredientsList(ingredient: json['ingredient']);
  }

  String toString() {
    return '$ingredient';
  }
}

// CLASS - TUTORIALSTEP
class TutorialStep {
  String? step;
  String? description;

  TutorialStep({this.step, this.description});

  Map<String, Object> toMap() {
    return {
      'step': step as String,
      'description': description as String,
    };
  }

  factory TutorialStep.fromJson(Map<String, Object> json) => TutorialStep(
        step: json['step'] as String,
        description: json['preparationSteps'] as String,
      );

  static List<TutorialStep> toList(List<Map<String, Object>> json) {
    return List.from(json)
        .map(
            (e) => TutorialStep(step: e['step'], description: e['description']))
        .toList();
  }
}

// CLASS - INGREDIENTS
class Ingredient {
  String name;
  String size;
  String unit;

  Ingredient({required this.name, required this.size, required this.unit});

  factory Ingredient.fromJson(Map<String, Object> json) => Ingredient(
        name: json['ingredient'] as String,
        size: json['quantity'] as String,
        unit: json['unit'] as String,
      );

  Map<String, Object> toMap() {
    return {'name': name, 'size': size, 'unit': unit};
  }

  static List<Ingredient> toList(List<Map<String, Object>> json) {
    return List.from(json)
        .map((e) =>
            Ingredient(name: e['name'], size: e['size'], unit: e['unit']))
        .toList();
  }
}


// class Details {
//   String totalTime;
//   List<String> images;
//   String name;
//   int numberOfServings;

//   Details(
//       {required this.totalTime,
//       required this.images,
//       required this.name,
//       required this.numberOfServings});

//   factory Details.fromJson(List<Map<String, dynamic>> json) {
//     totalTime: json['totalTime'],
//     totalTime: json['images'][0][],
//   }
// }


// class 