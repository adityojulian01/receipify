import 'package:flutter/material.dart';
import 'package:superapp/models/core/recipe_result_param.dart';
import 'package:superapp/models/core/recipe_search.dart';
import 'package:superapp/models/core/spoon.api.dart';
import 'package:superapp/widgets/search_recipe_tile.dart';
import 'package:superapp/widgets/search_recipe_tile_include.dart';

class DataSearchRecipe extends SearchDelegate<String> {
  //final TextEditingController searchInputController = TextEditingController();
  // final List<RecipeAPI> ingredientsName;
  // final searchResult = ingredientsName.
  //final List<String> addedItems;
  //final Function addOrRemove;
  bool includeIngredients;
  String includedIngredients;

  DataSearchRecipe(this.includeIngredients, this.includedIngredients
      //required this.ingredientsName,
      //required this.addOrRemove,
      //@required this.addedItems
      );

  RecipeResult? searchResult;
  RecipeResultWithParam? searchResultWithParam;
  bool _isLoading = true;
  // bool isIncludeIngredients = false;

  Future<void> getRecipeResult(String name) async {
    searchResult = await SpoonRecipeAPI.getRecipeResult(name);
    _isLoading = false;
  }

  Future<void> getRecipeResultWithParam(String name, String ing) async {
    searchResultWithParam =
        await SpoonRecipeAPI.getRecipeResultWithParam(name, ing);
    _isLoading = false;
    if (searchResultWithParam!.results!.isNotEmpty) {
      print("result is not empty");
    }
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // Action for App Bar
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon on the left of the app bar
    return IconButton(
      onPressed: () {
        close(context, query);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // final List<String> result = [];
    // final List<RecipeAPI> filteredResult = [];

    // for (int i = 0; i < ingredientsName.length; i++) {
    //   final matchResult = (ingredientsName[i].name?.toLowerCase())
    //       ?.contains(query.toLowerCase());
    //   if (matchResult == true) {
    //     result.add(ingredientsName[i].name as String);
    //     for (int q = 0; q < ingredientsName.length; q++) {
    //       if (ingredientsName[q]
    //               .name
    //               ?.contains(ingredientsName[i].name as String) ==
    //           true) {
    //         filteredResult.add(ingredientsName[q]);
    //       }
    //     }
    //   }
    // }

    // Show results based on the selection
    // final List<Recipe> allResults = ingredientsName
    //     .where(
    //       (singleElement) => singleElement.contains(
    //         query.toLowerCase(),
    //       ),
    //     )
    //     .toList();
    // getRecipeResult(query);

    return FutureBuilder(
      future: includeIngredients == false
          ? getRecipeResult(query)
          : getRecipeResultWithParam(query, includedIngredients),
      builder: (BuildContext context, AsyncSnapshot setState) {
        Widget children;
        if (_isLoading == false) {
          children = ListView.separated(
            padding: EdgeInsets.all(16),
            shrinkWrap: true,
            itemCount: includeIngredients == false
                ? searchResult!.results!.length
                : searchResultWithParam!.results!.length,
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return SizedBox(height: 30);
            },
            itemBuilder: (context, index) => includeIngredients == false
                ? SearchRecipeTile(data: searchResult!.results![index])
                : SearchRecipeTileInclude(
                    data: searchResultWithParam!.results![index]),
            // itemBuilder: (context, index) =  > RecipeTile(
            //   data: filteredResult[index],
            // ),
          );
        } else {
          children = Center(child: CircularProgressIndicator());
        }
        return children;
      },
    );

    //       // ListTile(
    //       //   onTap: () {
    //       //     query = (allResults[index]['title']).toString();
    //       //   },
    //       //   title: Text((allResults[index]['title']).toString()),
    //       //   leading: Icon(Icons.kitchen),
    //       //   // trailing: IconButton(
    //       //   //   onPressed: () {
    //       //   //     setState(
    //       //   //       () {
    //       //   //         addOrRemove(allResults[index]);
    //       //   //       },
    //       //   //     );
    //       //   //   },
    //       //   //   icon: addedItems.contains(allResults[index])
    //       //   //       ? Icon(Icons.remove)
    //       //   //       : Icon(Icons.add),
    //       //   // ),
    //       // ),
    //       // itemCount: allResults.length,
    //     );
    //   },
    // );
    // return StatefulBuilder(
    //   builder: (BuildContext context, StateSetter setState) {
    //     return ListView.builder(
    //       itemBuilder: (context, index) => ListTile(
    //         onTap: () {
    //           query = result[index];
    //         },
    //         title: Text(result[index]),
    //         leading: Icon(Icons.search),
    //       ),
    //       itemCount: result.length,
    //     );
    //   },
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
  // final List<Recipe> allResults = ingredientsName
  //     .where(
  //       (singleElement) => singleElement.toString().contains(
  //             query.toLowerCase(),
  //           ),
  //     )
  //     .toList();

  // return StatefulBuilder(
  //   builder: (BuildContext context, StateSetter setState) {
  //     return ListView.builder(
  //       itemBuilder: (context, index) => ListView.separated(
  //         padding: EdgeInsets.all(16),
  //         shrinkWrap: true,
  //         itemCount: RecipeHelper.searchResultRecipe.length,
  //         physics: BouncingScrollPhysics(),
  //         separatorBuilder: (context, index) {
  //           return SizedBox(height: 16);
  //         },
  //         itemBuilder: (context, index) {
  //           return RecipeTile(
  //             data: RecipeHelper.searchResultRecipe[index],
  //           );
  //         },
  //       ),
  //       // ListTile(
  //       //   onTap: () {
  //       //     query = (allResults[index]['title']).toString();
  //       //   },
  //       //   title: Text((allResults[index]['title']).toString()),
  //       //   leading: Icon(Icons.kitchen),
  //       //   // trailing: IconButton(
  //       //   //   onPressed: () {
  //       //   //     setState(
  //       //   //       () {
  //       //   //         addOrRemove(allResults[index]);
  //       //   //       },
  //       //   //     );
  //       //   //   },
  //       //   //   icon: addedItems.contains(allResults[index])
  //       //   //       ? Icon(Icons.remove)
  //       //   //       : Icon(Icons.add),
  //       //   // ),
  //       // ),
  //       //itemCount: allResults.length,
  //     );
  //   },
  // );
  // final List<String> result = [];

  // for (int i = 0; i < ingredientsName.length; i++) {
  //   final matchResult = (ingredientsName[i].name?.toLowerCase())
  //       ?.contains(query.toLowerCase());
  //   if (matchResult == true) {
  //     result.add(ingredientsName[i].name as String);
  //   }
  // }

  // Show results based on the selection
  // final List<Recipe> allResults = ingredientsName
  //     .where(
  //       (singleElement) => singleElement.contains(
  //         query.toLowerCase(),
  //       ),
  //     )
  //     .toList();

  // return StatefulBuilder(
  //   builder: (BuildContext context, StateSetter setState) {
  //     return ListView.builder(
  //       itemBuilder: (context, index) => ListTile(
  //         onTap: () {
  //           query = result[index];
  //         },
  //         title: Text(result[index]),
  //         leading: Icon(Icons.search),
  //       ),
  //       itemCount: result.length,
  //     );
  //   },
  // );
}
