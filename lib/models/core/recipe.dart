// CLASS - RECIPE
class Recipe {
  String title;
  String photo;
  String servings;
  String time;
  String description;

  List<Ingredient> ingredients;
  List<TutorialStep> tutorial;

  Recipe({
    required this.title,
    required this.photo,
    required this.servings,
    required this.time,
    required this.description,
    required this.ingredients,
    required this.tutorial,
  });

  factory Recipe.fromJson(Map<String, Object> json) {
    return Recipe(
      title: json['title'] as String,
      photo: json['photo'] as String,
      servings: json['servings'] as String,
      time: json['time'] as String,
      description: json['description'] as String,
      ingredients: json['ingredients'] as List<Ingredient>,
      tutorial: json['tutorial'] as List<TutorialStep>,
    );
  }
  contains(String lowerCase) {}
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
        description: json['description'] as String,
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
  String? name;
  String? size;

  Ingredient({this.name, this.size});
  factory Ingredient.fromJson(Map<String, Object> json) => Ingredient(
        name: json['name'] as String,
        size: json['size'] as String,
      );

  Map<String, Object> toMap() {
    return {
      'name': name as String,
      'size': size as String,
    };
  }

  static List<Ingredient> toList(List<Map<String, Object>> json) {
    return List.from(json)
        .map((e) => Ingredient(name: e['name'], size: e['size']))
        .toList();
  }
}
