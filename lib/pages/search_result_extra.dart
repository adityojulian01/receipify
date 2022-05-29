import 'package:flutter/material.dart';
import 'package:superapp/models/core/recipe_spoon.dart';
import 'package:superapp/widgets/recipe_tile_extra.dart';

class SearchResultExtra extends StatefulWidget {
  late List<Recipe> searchResultRecipe;

  SearchResultExtra({Key? key, required this.searchResultRecipe})
      : super(key: key);

  @override
  State<SearchResultExtra> createState() => _SearchResultExtraState();
}

class _SearchResultExtraState extends State<SearchResultExtra> {
  final TextEditingController searchInputController = TextEditingController();

  //late List<RecipeAPI> searchResultRecipe;

  @override
  Widget build(BuildContext context) {
    final length = widget.searchResultRecipe.length;

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Search result',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
                fontSize: 16)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            // Navigator.push(context,
            //     new MaterialPageRoute(builder: (context) => new RecipePage()));
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        shrinkWrap: true,
        itemCount: widget.searchResultRecipe.length,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
        itemBuilder: (context, index) {
          return RecipeTileExtra(
            data: widget.searchResultRecipe[index],
          );
        },
      ),
    );
  }
}
