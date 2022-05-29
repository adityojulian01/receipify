import 'package:flutter/material.dart';
import 'package:superapp/models/core/recipe.dart';
import 'package:superapp/models/core/recipe_search.dart';
import 'package:superapp/models/core/spoon.api.dart';
import 'package:superapp/pages/recipe_category.dart';

class MealTypeCard extends StatefulWidget {
  final String title;
  final IconData icon;
  String type;

  MealTypeCard(
      {Key? key, required this.title, required this.icon, required this.type})
      : super(key: key);

  @override
  State<MealTypeCard> createState() => _MealTypeCardState();
}

class _MealTypeCardState extends State<MealTypeCard> {
  RecipeResult? searchResult;
  bool _isLoading = true;

  Future<void> getRecipeResult(String name) async {
    searchResult = await SpoonRecipeAPI.getRecipeResult(name);
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await getRecipeResult(widget.title.toLowerCase());
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RecipeCategory(
                searchResult: searchResult!, type: widget.type)));
      },
      style: ElevatedButton.styleFrom(
          onPrimary: Colors.white, primary: Colors.white),
      child: Container(
          color: Colors.white,
          width: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                this.widget.icon,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
              Text(
                this.widget.title,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          )),
    );
  }
}
