import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
//import 'package:superapp/models/core/recipe_result_param.dart';
import 'package:superapp/models/core/recipe_search.dart';
import 'package:superapp/models/core/recipedetail_spoon.dart';
import 'package:superapp/models/core/spoon.api.dart';
import 'package:superapp/pages/recipe_detail_page.dart';

class RecipeCard extends StatefulWidget {
  final String? imgSrc;
  final String? title;
  final String? prepTime;
  final String? cookTime;
  Result? recipeResult;

  RecipeCard(
      {Key? key,
      this.imgSrc,
      this.title,
      this.prepTime,
      this.cookTime,
      this.recipeResult})
      : super(key: key);

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    RecipeDetail? mealDetail;
    bool _isLoading = true;

    Future<void> getRecipesDetail(int id) async {
      mealDetail = await SpoonRecipeAPI.getRecipeDetail(id);
      setState(() {
        _isLoading = false;
      });
    }

    ThemeMode check() {
      ThemeMode themeMode = EasyDynamicTheme.of(context).themeMode!;
      print(themeMode);
      return themeMode;
    }

    return GestureDetector(
      onTap: () async {
        await getRecipesDetail(widget.recipeResult!.id!);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RecipeDetailPage(data: mealDetail!)));
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            width: 170,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(widget.recipeResult!.image!),
                  fit: BoxFit.fill),
            ),
            // child: Image.network(
            //   recipeResult?.image as String,
            //   fit: BoxFit.fill,
            // ),
          ),
          Positioned(
            bottom: 10,
            right: 5,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              width: 160,
              height: 50,
              //color: Colors.white.withOpacity(0.9),
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    widget.recipeResult?.title as String,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Montserrat',
                        color: check() == ThemeMode.dark
                            ? Colors.black
                            : Colors.black),
                  ),
                  // Text(
                  //   'Servings: ${this.prepTime}',
                  //   style: TextStyle(
                  //     fontFamily: 'Montserrat',
                  //     fontSize: 12,
                  //     fontWeight: FontWeight.w800,
                  //     color: Colors.black54,
                  //   ),
                  // ),
                  // Text(
                  //   'Cook Time: ${this.cookTime}',
                  //   style: TextStyle(
                  //     fontFamily: 'Montserrat',
                  //     fontSize: 12,
                  //     fontWeight: FontWeight.w800,
                  //     color: Colors.black54,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
