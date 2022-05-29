import 'package:flutter/material.dart';
import 'package:superapp/models/core/recipe_result_param.dart';
//import 'package:superapp/models/core/recipe_search.dart';
// import 'package:superapp/models/core/recipe.dart';
import 'package:superapp/models/core/recipedetail_spoon.dart';
import 'package:superapp/models/core/spoon.api.dart';
import 'package:superapp/pages/recipe_detail_page.dart';

class SearchRecipeTileInclude extends StatefulWidget {
  final Result data;
  SearchRecipeTileInclude({Key? key, required this.data}) : super(key: key);

  @override
  State<SearchRecipeTileInclude> createState() =>
      _SearchRecipeTileIncludeState();
}

class _SearchRecipeTileIncludeState extends State<SearchRecipeTileInclude> {
  late RecipeDetail mealDetail;
  bool _isLoading = true;

  Future<void> getRecipesDetail(int id) async {
    mealDetail = await SpoonRecipeAPI.getRecipeDetail(id);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await this.getRecipesDetail(widget.data.id!);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RecipeDetailPage(data: mealDetail)));
      },
      child: Container(
        height: 90,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // RECIPE PHOTO
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blueGrey,
                image: DecorationImage(
                    image: NetworkImage(widget.data.image as String),
                    fit: BoxFit.cover),
              ),
            ),
            // RECIPE INFO
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // RECIPE TITLE
                    Container(
                      margin: EdgeInsets.only(bottom: 12),
                      child: Text(
                        widget.data.title as String,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    // RECIPE SERVINGS AND TIME
                    Row(
                      children: [
                        Icon(Icons.check, size: 14, color: Colors.black),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            widget.data.usedIngredientCount.toString(),
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'Montserrat'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.cancel,
                          size: 14,
                          color: Colors.black,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            widget.data.missedIngredientCount.toString(),
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
