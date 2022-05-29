import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superapp/models/auth.dart';
import 'package:superapp/models/core/user_ingredients_api.dart';
import 'package:superapp/utils/app_color.dart';
import 'package:superapp/widgets/inventory_list.dart';
import 'package:superapp/widgets/search_bar.dart';
import 'package:superapp/assets/ingredients.dart';
import 'package:superapp/models/core/spoon.api.dart';

class InventoryPage extends StatefulWidget {
  // final List<String> addedItems;

  const InventoryPage({Key? key}) : super(key: key);

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  UserIngredients? userIng;
  List<String> selectedItems = [];
  bool isLoading = true;
  int ingLength = 0;

  @override
  void initState() {
    print(idAuth!);
    getIng(idAuth!, accessToken!);
    // setState(() {
    //   selectedItems = userIng!.body!.split(',');
    // });
    super.initState();
  }

  Future<void> getIng(int id, String apiKey) async {
    userIng = await SpoonRecipeAPI.getIngredients(id, apiKey);
    setState(() {
      selectedItems = userIng!.body!.split(',');
      isLoading = false;
      ingLength = selectedItems.length;
    });
  }

  _addOrRemove(String itemName) {
    if (selectedItems.contains(itemName) == true) {
      setState(() {
        selectedItems.remove(itemName);
        // print(historyItems);
      });
    } else {
      setState(() {
        selectedItems.add(itemName);
        // mostCommon.contains(itemName) ? mostCommon.remove(itemName) : {};
        // historyItems.contains(itemName) ? {} : historyItems.add(itemName);
      });
      print(selectedItems);
      // print(historyItems);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Text(
            'Inventory',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.maxFinite,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10),
            child: Builder(
              builder: (context) => GestureDetector(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: DataSearch(
                        ingredientsName: ingredients,
                        addOrRemove: _addOrRemove,
                        addedItems: selectedItems),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 10),
                  width: size.width - 38,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColor.greyLine),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 14),
                      Text(
                        'Search for ingredients',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            width: size.width - 38,
            height: size.height - 400,
            margin: const EdgeInsets.only(top: 10, bottom: 25),
            decoration: BoxDecoration(
                color: AppColor.backBox,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.transparent,
                  width: 2,
                  style: BorderStyle.solid,
                )),
            child: Container(
              height: size.height - 420,
              child: isLoading == false
                  ? InventoryList(
                      inventoryItems: selectedItems, removeItem: _addOrRemove)
                  : const Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator()),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: AppColor.greyBox),
                onPressed: () => showSearch(
                    context: context,
                    delegate: DataSearch(
                        ingredientsName: ingredients,
                        addOrRemove: _addOrRemove,
                        addedItems: selectedItems)),
                icon: Icon(
                  Icons.add,
                  color: AppColor.greyText,
                ),
                label: Text(
                  'Add',
                  style: TextStyle(
                      color: AppColor.greyText,
                      fontFamily: 'Montserrat',
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: selectedItems.length == ingLength
                        ? AppColor.greyBox
                        : AppColor.primary),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await SpoonRecipeAPI.updateIngredients(
                      idAuth!, selectedItems.join(','), accessToken!);
                  setState(() {
                    isLoading = false;
                    ingLength = selectedItems.length;
                  });
                },
                icon: Icon(
                  Icons.update,
                  color: selectedItems.length == ingLength
                      ? AppColor.greyText
                      : Colors.white,
                ),
                label: Text(
                  'Update',
                  style: TextStyle(
                      color: selectedItems.length == ingLength
                          ? AppColor.greyText
                          : Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
