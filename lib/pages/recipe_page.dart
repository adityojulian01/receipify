import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:superapp/models/auth.dart';
import 'package:superapp/models/core/recipe_search.dart';
import 'package:superapp/models/core/spoon.api.dart';
import 'package:superapp/models/core/user_ingredients_api.dart';
import 'package:superapp/utils/app_color.dart';
import 'package:superapp/widgets/meal_type_card.dart';
//import 'package:receipify/widgets/navigation_bar.dart';
import 'package:superapp/widgets/recipe_card.dart';
import 'package:superapp/widgets/search_bar_recipe.dart';

class RecipePage extends StatefulWidget {
  String includedIngredients;

  RecipePage({Key? key, required this.includedIngredients}) : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  //late List<RecipeAPI> _recipes;
  bool _isLoading = true;

  bool isIncludeIngredients = false;

  RecipeResult? searchResult;

  UserIngredients? userIng;

  late String includedIngredients;

  Future<void> getIng(int id, String apiKey) async {
    userIng = await SpoonRecipeAPI.getIngredients(id, apiKey);
    setState(() {
      includedIngredients = userIng!.body!;
      _isLoading = false;
    });
  }

  Future<void> getRecipeResult(String name) async {
    searchResult = await SpoonRecipeAPI.getRecipeResult(name);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    getRecipeResult('fried rice');
    getIng(idAuth!, accessToken!);
    super.initState();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getRecipes();
  // }

  // Future<void> getRecipes() async {
  //   _recipes = await RecipeApi.getRecipe();
  //   setState(() {
  //     _isLoading = false;
  //   });
  //   print(_recipes[0].ingredientsList);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text('Receipify',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
                fontSize: 20)),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment
                  .stretch, // force all text to take available width of the column
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Row(
                    children: [
                      Text(
                        'What would you like to \ncook today?',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          letterSpacing: 1,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Builder(
                      builder: (context) => GestureDetector(
                        onTap: () {
                          print(includedIngredients);
                          showSearch(
                            context: context,
                            delegate: DataSearchRecipe(
                                isIncludeIngredients, includedIngredients),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          padding: EdgeInsets.only(left: 20),
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.search,
                                color: Colors.black,
                              )
                            ],
                          ),
                          //filled: true,
                          // enabledBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: Colors.grey[200],
                          //   ),
                          //   borderRadius: BorderRadius.circular(14.0),
                          // ),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: isIncludeIngredients == false
                              ? AppColor.greyBox
                              : AppColor.primary),
                      onPressed: () {
                        setState(() {
                          isIncludeIngredients = !isIncludeIngredients;
                        });
                        print(isIncludeIngredients);
                      },
                      icon: isIncludeIngredients == false
                          ? Icon(Icons.check,
                              color: isIncludeIngredients == false
                                  ? AppColor.greyText
                                  : Colors.white)
                          : Icon(Icons.cancel,
                              color: isIncludeIngredients == false
                                  ? AppColor.greyText
                                  : Colors.white),
                      label: isIncludeIngredients == false
                          ? Text(
                              'Include Inventory',
                              style: TextStyle(
                                  color: isIncludeIngredients == false
                                      ? AppColor.greyText
                                      : Colors.white),
                            )
                          : Text(
                              'Remove Inventory',
                              style: TextStyle(
                                  color: isIncludeIngredients == false
                                      ? AppColor.greyText
                                      : Colors.white),
                            ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Text(
                    'Popular Recipes',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  height: 130,
                  child: _isLoading == false
                      ? ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => RecipeCard(
                              recipeResult: searchResult?.results![index]),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10),
                          // children: [
                          //   RecipeCard(
                          //     imgSrc:
                          //         'https://therecipecritic.com/wp-content/uploads/2017/08/shrimpfriedrice.jpg',
                          //     title: 'Shrimp Fried Rice',
                          //     prepTime: '2 servings',
                          //     cookTime: '15 mins',
                          //   ),
                          //   RecipeCard(
                          //     imgSrc:
                          //         'https://www.cookingclassy.com/wp-content/uploads/2020/10/spaghetti-carbonara-01.jpg',
                          //     title: 'Pasta Carbonara',
                          //     prepTime: '2 servings',
                          //     cookTime: '30 mins',
                          //   ),
                          //   RecipeCard(
                          //     imgSrc:
                          //         'https://www.onceuponachef.com/images/2018/02/pan-seared-salmon-.jpg',
                          //     title: 'Pan-Seared Salmon',
                          //     prepTime: '4 servings',
                          //     cookTime: '45 mins',
                          //   ),
                          //   RecipeCard(
                          //     imgSrc:
                          //         'https://www.thespruceeats.com/thmb/yMZPPKIKd3n1E8zLWhTt_EXR56U=/2000x1511/filters:no_upscale()/chicken-katsu-4778466-09-e38cf8d3d6864a9c860034d49e76df25.jpg',
                          //     title: 'Chicken Katsu',
                          //     prepTime: '1 servings',
                          //     cookTime: '30 mins',
                          //   ),
                          // ],
                        )
                      : Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator()),
                ),
                Container(
                  height: 90,
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 15),
                  child: Row(
                    children: [
                      Expanded(
                        // child: OutlinedButton(
                        //   child: Text('See history and completed',
                        //       style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.w900,
                        //           fontFamily: 'Montserrat')),
                        //   onPressed: () {
                        //     Navigator.of(context).pushReplacement(
                        //       MaterialPageRoute(
                        //           builder: (context) => HomePage()),
                        //     );
                        //   },
                        //   style: OutlinedButton.styleFrom(
                        //     backgroundColor: Theme.of(context).primaryColor,
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(20)),
                        //   ),
                        // ),
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Theme.of(context).primaryColor,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.receipt_long_outlined,
                              color: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade200,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'See completed & history',
                            hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 110,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //scrollDirection: Axis.horizontal,
                    children: [
                      MealTypeCard(
                        title: 'Chicken',
                        icon: FontAwesomeIcons.drumstickBite,
                        type: 'Chicken',
                      ),
                      SizedBox(width: 10),
                      MealTypeCard(
                        title: 'Beef',
                        icon: FontAwesomeIcons.cow,
                        type: 'Beef',
                      ),
                      SizedBox(width: 10),
                      MealTypeCard(
                        title: 'Rice',
                        icon: FontAwesomeIcons.bowlRice,
                        type: 'Rice',
                      ),
                      // MealTypeCard(
                      //   title: 'Noodle',
                      //   icon: Icons.dinner_dining,
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 110,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //scrollDirection: Axis.horizontal,
                    children: [
                      MealTypeCard(
                        title: 'Potato',
                        icon: FontAwesomeIcons.bowlFood,
                        type: 'Potato',
                      ),
                      SizedBox(width: 10),
                      MealTypeCard(
                        title: 'Cake',
                        icon: FontAwesomeIcons.candyCane,
                        type: 'Cake',
                      ),
                      SizedBox(width: 10),
                      MealTypeCard(
                        title: 'Seafood',
                        icon: FontAwesomeIcons.fish,
                        type: 'Seafood',
                      ),
                      // MealTypeCard(
                      //   title: 'Noodle',
                      //   icon: Icons.dinner_dining,
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //   child: NavigationBar(),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
