import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp/models/core/recipe_search.dart';
import 'package:superapp/models/core/recipe_spoon.dart';
// import 'package:superapp/models/core/recipe.dart';
import 'package:superapp/models/core/recipeapi.dart';
import 'package:superapp/models/core/recipedetail_spoon.dart';
import 'package:superapp/models/core/spoon.api.dart';
import 'package:superapp/pages/recipe_detail_page.dart';

class SearchRecipeTile extends StatefulWidget {
  final Result data;
  SearchRecipeTile({required this.data});

  @override
  State<SearchRecipeTile> createState() => _SearchRecipeTileState();
}

class _SearchRecipeTileState extends State<SearchRecipeTile> {
  RecipeDetail? mealDetail;
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
            builder: (context) => RecipeDetailPage(data: mealDetail!)));
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
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  //margin: EdgeInsets.only(bottom: 12),
                  child: Text(
                    widget.data.title as String,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
