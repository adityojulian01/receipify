import 'package:flutter/material.dart';
import 'package:superapp/models/core/recipe_search.dart';
import 'package:superapp/widgets/recipe_card.dart';

class RecipeCategory extends StatefulWidget {
  RecipeResult searchResult;
  String type;

  RecipeCategory({Key? key, required this.searchResult, required this.type})
      : super(key: key);

  @override
  State<RecipeCategory> createState() => _RecipeCategoryState();
}

class _RecipeCategoryState extends State<RecipeCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.type + " Recipes"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1.5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: widget.searchResult.results?.length,
            itemBuilder: (BuildContext context, index) {
              return RecipeCard(
                  recipeResult: widget.searchResult.results![index]);
            }),
      ),
    );
  }
}
