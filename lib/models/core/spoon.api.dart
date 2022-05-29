import 'dart:convert';
import 'package:requests/requests.dart';
import 'package:superapp/models/core/login_token.dart';
import 'package:superapp/models/core/receipt_library_model.dart';
import 'package:superapp/models/core/recipe_result_param.dart';
import 'package:superapp/models/core/recipe_search.dart';
import 'package:superapp/models/core/recipe_spoon.dart';
import 'package:superapp/models/core/recipedetail_spoon.dart';
import 'package:http/http.dart' as http;
import 'package:superapp/models/core/user_ingredients_api.dart';
import 'dart:io';

import 'login_model.dart';

String APIKey = '1bc22d6b4bca4d569f9b2566dcbcf114';

class SpoonRecipeAPI {
  static Future<List<Recipe>> getRecipe(String ingredients) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://api.spoonacular.com/recipes/findByIngredients?ingredients=$ingredients&number=20&limitLicense=true&ranking=1&ignorePantry=true&apiKey=$APIKey'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      // var jsonResponse = request.body;
      return recipeFromJson(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      throw "Error";
    }
  }

  static Future<RecipeDetail> getRecipeDetail(int id) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://api.spoonacular.com/recipes/$id/information?includeNutrition=false&apiKey=$APIKey'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      return RecipeDetailFromJson(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      throw "Error";
    }
  }

  static Future<RecipeResult> getRecipeResult(String query) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://api.spoonacular.com/recipes/complexSearch?query=$query&instructionsRequired=true&number=20&limitLicense=true&apiKey=$APIKey'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      return recipeResultFromJson(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      throw "Error";
    }
  }

  static Future<RecipeResultWithParam> getRecipeResultWithParam(
      String query, String ing) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://api.spoonacular.com/recipes/complexSearch?query=$query&includeIngredients=$ing&instructionsRequired=true&sort=max-used-ingredients&sortDirection=asc&number=20&limitLicense=true&apiKey=$APIKey'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      return recipeResultWithParamFromJson(
          await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      throw "Error";
    }
  }

  static Future<UserIngredients> createUser(int? userID, String? body) async {
    var response = await http.post(
      Uri.parse('http://10.0.2.2:8000/items/create/'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{'userID': userID, 'body': body}),
    );

    if (response.statusCode == 200) {
      return userIngredientsFromJson(response.body);
    } else {
      throw Exception('Failed to create user');
    }
  }

  static Future<UserIngredients> getIngredients(int id, String apiKey) async {
    var response = await http.get(Uri.parse('http://10.0.2.2:8000/items/$id/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + apiKey
        });

    if (response.statusCode == 200) {
      return userIngredientsFromJson(response.body);
    } else {
      throw Exception('Failed to get user data');
    }
  }

  static Future<UserIngredients> updateIngredients(
      int id, String updatedIng, String apiKey) async {
    var response = await http.patch(
      Uri.parse('http://10.0.2.2:8000/items/$id/update/'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + apiKey
      },
      body: json.encode(<String, String>{"body": updatedIng}),
    );

    if (response.statusCode == 200) {
      return userIngredientsFromJson(response.body);
    } else {
      throw Exception('Failed to create user');
    }
  }

  static Future<LoginModel> registerUser(
      String? username, String? email, String? password) async {
    var response = await http.post(
      Uri.parse('http://10.0.2.2:8000/users/register/'),
      headers: <String, String>{"Content-Type": "application/json"},
      body: json.encode(
        <String, String?>{
          "username": username,
          "email": email,
          "password": password
        },
      ),
    );

    if (response.statusCode == 200) {
      return loginModelFromJson(response.body);
    } else {
      throw Exception("Failed to register user");
    }
  }

  static Future<LoginModel> loginUser(
      String? username, String? password) async {
    var response = await http.post(
      Uri.parse('http://10.0.2.2:8000/users/login/'),
      headers: <String, String>{"Content-Type": "application/json"},
      body: json.encode(
        <String, String?>{"username": username, "password": password},
      ),
    );

    if (response.statusCode == 200) {
      return loginModelFromJson(response.body);
    } else {
      throw Exception("Failed to login user");
    }
  }

  static Future<bool> uploadImage(
      File imageFile, int userID, String ingredients, String apiKey) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://10.0.2.2:8000/receipt/$userID/upload/'));

    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + apiKey
    };

    request.headers.addAll(headers);

    request.fields['userID'] = userID.toString();
    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile.path));
    request.fields['ingredients'] = ingredients;

    var response = await request.send();

    final responseStr = await response.stream.bytesToString();
    print('responseBody: ' + responseStr);

    if (response.statusCode == 200) {
      return true;
    } else {
      print(responseStr);
      return false;
    }
  }

  static Future<List<ReceiptLibrary>> getUserReceipt(
      int userID, String apiKey) async {
    var response = await http
        .get(Uri.parse('http://10.0.2.2:8000/receipt/$userID/'), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + apiKey
    });

    if (response.statusCode == 200) {
      return receiptLibraryFromJson(response.body);
    } else {
      throw Exception('Failed to get user data');
    }
  }

  static Future<LoginToken> getLoginToken(username, password) async {
    var response = await http.post(Uri.parse('http://10.0.2.2:8000/token/'),
        headers: <String, String>{"Content-Type": "application/json"},
        body: json.encode(
          <String, String?>{"username": username, "password": password},
        ));
    if (response.statusCode == 200) {
      return loginTokenFromJson(response.body);
    } else {
      throw Exception('Failed to login user');
    }
  }

  static Future<String> extractImage(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);

    // var response = await http.post(Uri.parse('http://10.0.2.2:8000/extract/'),
    //     headers: <String, String>{"Content-Type": "application/json"},
    //     body: json.encode(<String, List<int>>{"image": imageBytes}));

    var response = await Requests.post('http://10.0.2.2:8000/extract/',
        body: {'image': base64Image},
        bodyEncoding: RequestBodyEncoding.FormURLEncoded);

    if (response.statusCode == 200) {
      return (response.json());
    } else {
      throw Exception('Failed');
    }
  }
}
