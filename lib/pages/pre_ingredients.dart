import 'package:flutter/material.dart';
import 'package:superapp/assets/ingredients.dart';
import 'package:superapp/pages/navbar_home.dart';
import 'package:superapp/utils/app_color.dart';
import 'package:superapp/widgets/heading_text.dart';
import 'package:superapp/widgets/navigator_button.dart';
import 'package:superapp/widgets/scrollable_box.dart';
import 'package:superapp/widgets/skip_button.dart';
import 'package:superapp/widgets/search_bar.dart';
import 'package:superapp/models/core/spoon.api.dart';
import 'package:superapp/models/auth.dart';

class PreIngredients extends StatefulWidget {
  PreIngredients({Key? key}) : super(key: key);

  @override
  State<PreIngredients> createState() => _PreIngredientsState();
}

class _PreIngredientsState extends State<PreIngredients> {
  List<String> selectedItems = [];
  List<String> historyItems = [];

  final mostCommon = [
    "butter",
    "eggs",
    "milk",
    "parmesan",
    "cheddar",
    "american cheese",
    "sour cream",
    "cream cheese",
    "mozzarella",
    "yogurt",
    "cream",
    "evaporated milk",
    "whipped cream",
    "chayote",
    "sweet corn",
    "lemon",
    "apple",
    "banana",
    "lime",
  ];

  _addOrRemove(String itemName) {
    if (selectedItems.contains(itemName) == true) {
      setState(() {
        selectedItems.remove(itemName);
        print(historyItems);
      });
    } else {
      setState(() {
        selectedItems.add(itemName);
        mostCommon.contains(itemName) ? mostCommon.remove(itemName) : {};
        historyItems.contains(itemName) ? {} : historyItems.add(itemName);
      });
      print(selectedItems);
      print(historyItems);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 340,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: HeadingText(
                      headText: 'What do you have in your kitchen?'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 24),
                  height: 143,
                  child: Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("img/pre-ing.png"),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                print("preing: $idAuth, $userNameAuth, $emailAuth");
                showSearch(
                  context: context,
                  delegate: DataSearch(
                      addOrRemove: _addOrRemove,
                      addedItems: selectedItems,
                      ingredientsName: ingredients),
                );
              },
              child: Container(
                height: 45,
                width: 328,
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColor.greyLine),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 14),
                    Text(
                      'Salt',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 250,
            width: 328,
            child: Container(
                child: ScrollableList(
              addingItem: _addOrRemove,
              mostCommonItem: mostCommon,
              itemName: historyItems,
              selectedItems: selectedItems,
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                SizedBox(
                  width: 239,
                  height: 49,
                  child: ElevatedButton(
                    child: const Text(
                      'NEXT',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                    onPressed: () async {
                      await SpoonRecipeAPI.updateIngredients(
                          idAuth!, selectedItems.join(','), accessToken!);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NavBarHome()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38)),
                      primary: AppColor.primary,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SkipButton(nextPage: NavBarHome()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
