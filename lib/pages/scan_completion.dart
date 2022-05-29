import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:superapp/assets/ingredients.dart';
import 'package:superapp/models/auth.dart';
//import 'package:superapp/models/core/recipe.dart';
import 'package:superapp/models/core/recipe_spoon.dart';
import 'package:superapp/models/core/spoon.api.dart';
import 'package:superapp/models/core/user_ingredients_api.dart';
import 'package:superapp/pages/search_result_extra.dart';
import 'package:superapp/utils/app_color.dart';
import 'package:superapp/widgets/scanned_items_scoll.dart';
import 'package:superapp/widgets/search_bar.dart';
import 'package:collection/collection.dart';

class ScanCompletion extends StatefulWidget {
  //final List<RecipeAPI> recipes;
  final List<String>? selectedItem;
  final List<String> scannedItems;
  File imageFile;
  ScanCompletion(
      {Key? key,
      this.selectedItem,
      required this.imageFile,
      required this.scannedItems})
      : super(key: key);

  @override
  State<ScanCompletion> createState() => _ScanCompletionState();
}

class _ScanCompletionState extends State<ScanCompletion>
    with WidgetsBindingObserver {
  // late List<String> combinedItems = scannedItems + widget.selectedItem;
  late List<String> combinedItems;
  late List<String> combinedWithoutDup = combinedItems.toSet().toList();
  //late List<RecipeAPI> addedItems = [];
  UserIngredients? userIng;
  List<String> selectedItems = [];
  late List<Recipe> _recipes;
  late Future<bool> doneLoading;
  bool _isLoading = true;
  late bool update;

  @override
  void initState() {
    getIng(idAuth!, accessToken!);
    super.initState();
  }

  Future<void> getRecipes(String ing) async {
    _recipes = await SpoonRecipeAPI.getRecipe(ing);
    setState(() {
      _isLoading = false;
    });
    print("combined recipes " + combinedWithoutDup.join(","));
  }

  Future<void> getIng(int id, String apiKey) async {
    userIng = await SpoonRecipeAPI.getIngredients(id, apiKey);
    setState(() {
      selectedItems = userIng!.body!.split(',');
      _isLoading = false;
      combinedItems = widget.scannedItems + selectedItems;
    });
  }

  Future<void> updateReceipt(
      int id, File image, String ingredients, String apiKey) async {
    update = await SpoonRecipeAPI.uploadImage(image, id, ingredients, apiKey);
  }

  Function matchItem = const DeepCollectionEquality.unordered().equals;

  bool compareList(List list1, List list2) {
    if (list2.every((item) => list1.contains(item))) {
      return true;
    } else {
      return false;
    }
  }

  // void checkAndAdd(List frstList, List<RecipeAPI> scndList) {
  //   setState(() {
  //     addedItems = [];
  //   });
  //   for (int i = 0; i < _recipes.length; i++) {
  //     if (frstList.length > scndList[i].ingredientsList!.length) {
  //       if (compareList(
  //           frstList,
  //           scndList[i]
  //               .ingredientsList!
  //               .map((e) => e.toString().toLowerCase())
  //               .toList())) {
  //         addedItems.add(_recipes[i]);
  //       }
  //     } else if (frstList.length == scndList[i].ingredientsList!.length) {
  //       if (matchItem(
  //           frstList,
  //           scndList[i]
  //               .ingredientsList
  //               ?.map((e) => e.toString().toLowerCase())
  //               .toList())) {
  //         addedItems.add(_recipes[i]);
  //       }
  //       print(_recipes[i]);
  //       print('match');
  //       print('added items: $addedItems');
  //     } else {
  //       print('no match');
  //     }
  //   }
  // }

  // @override
  // void initState() {
  //   checkAndAdd(combinedItems.map((e) => e.toLowerCase()).toList(),
  //       widget.recipes); // TODO: implement initState
  //   super.initState();
  // }

  // final scannedItems = [
  //   "butter",
  //   "eggs",
  //   "milk",
  //   "salt",
  //   "cheddar",
  //   "chili",
  //   "curry powder",
  //   "tomato",
  //   "mozzarella",
  //   "yogurt",
  //   "cream",
  //   "condensed milk",
  //   "lemon",
  //   "apple",
  //   "banana",
  //   "lime",
  // ];
  // final scannedItems = [
  //   'low sodium chicken broth',
  //   'sun dried tomatoes',
  //   'Italian seasoning',
  //   'minced garlic',
  //   'chicken breast',
  //   'whole wheat noodles',
  //   'baby spinach',
  //   '2% plain Greek yogurt',
  //   'cottage cheese',
  //   'Parmesan',
  //   'fresh basil',
  //   'salt',
  //   'pepper'
  // ];

  //final scannedItems = receipt[0].ingredients.split(",");

  // void _addOrRemove(String itemName) {
  //   if (scannedItems.contains(itemName)) {
  //     setState(() {
  //       scannedItems.remove(itemName);
  //       print(scannedItems);
  //     });
  //   } else {
  //     setState(() {
  //       scannedItems.insert(0, itemName);
  //       print(scannedItems);
  //     });
  //   }
  // }
  // List<String> combineWitoutDuplicate(List list1, List list2) {
  //   return list1.addAll(list2..removeWhere((element) => list1.contains(element)));
  // }

  // void _addOrRemove(String itemName) {
  //   if (combinedItems.contains(itemName)) {
  //     setState(() {
  //       combinedItems.remove(itemName);
  //       print(combinedItems);
  //     });
  //   } else {
  //     setState(() {
  //       combinedItems.toSet().toList();
  //       combinedItems.insert(0, itemName);
  //       print(combinedItems);
  //     });
  //   }
  // }

  void _addOrRemove(String itemName) {
    if (combinedWithoutDup.contains(itemName)) {
      setState(() {
        combinedWithoutDup.remove(itemName);
        print(combinedItems);
      });
    } else {
      setState(() {
        combinedWithoutDup.toSet().toList();
        combinedWithoutDup.insert(0, itemName);
        print(combinedItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return _isLoading == false
        ? Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                flexibleSpace: Container(
                  alignment: Alignment.center,
                  //height: 200,
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 67, left: 60),
                  // margin: const EdgeInsets.only(top: 150),
                  // child: const Flexible(
                  child: const AutoSizeText(
                    'Here are the ingredients that you got for us',
                    textDirection: TextDirection.ltr,
                    maxLines: 2,
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        color: Colors.black),
                  ),
                  //),
                ),
                leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black,
                ),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   height: 70,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Container(
                //         alignment: Alignment.topLeft,
                //         child: IconButton(
                //             onPressed: () => Navigator.of(context).pop(),
                //             icon: const Icon(Icons.arrow_back)),
                //       ),
                //       Container(
                //         alignment: Alignment.topLeft,
                //         child: Text('Here\\'s what you got for us'),
                //       )
                //     ],
                //   ),
                // ),
                Container(
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 19),
                  child: Builder(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        print(combinedWithoutDup);
                        showSearch(
                            context: context,
                            delegate: DataSearch(
                                ingredientsName: ingredients,
                                addOrRemove: _addOrRemove,
                                addedItems: combinedWithoutDup));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 45,
                        width: size.width - 47,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColor.greyLine),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 14),
                            Text(
                              'Cinnamon',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: size.width - 47,
                  height: size.height - 400,
                  margin: const EdgeInsets.only(top: 10, bottom: 40),
                  child: ScannedItemList(
                      itemName: combinedWithoutDup, removeItem: _addOrRemove),
                ),
                Column(
                  children: [
                    Container(
                      width: size.width - 200,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () async {
                          await this.getRecipes(combinedWithoutDup.join(","));
                          // checkAndAdd(
                          //     combinedWithoutDup
                          //         .map((e) => e.toLowerCase())
                          //         .toList(),
                          //     _recipes);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SearchResultExtra(
                                  searchResultRecipe: _recipes)));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: const Text(
                          'SCAN',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: size.width - 200,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () async {
                          await updateReceipt(idAuth!, widget.imageFile,
                              widget.scannedItems.join(","), accessToken!);
                          if (update == true) {
                            print("update successfull");
                          } else {
                            print("update failed");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: const AutoSizeText(
                          'Add Receipt and Ingredients to Library',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                )
                // : const Align(
                //     alignment: Alignment.center,
                //     child: CircularProgressIndicator(),
                //   )
              ],
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
