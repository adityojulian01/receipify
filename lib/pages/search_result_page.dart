import 'package:flutter/material.dart';
import 'package:superapp/models/core/recipe_spoon.dart';
import 'package:superapp/widgets/recipe_tile.dart';

class SearchResult extends StatefulWidget {
  late List<Recipe> searchResultRecipe;

  SearchResult({Key? key, required this.searchResultRecipe}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
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
        title: Text('Search result',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
                fontSize: 16)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            // Navigator.push(context,
            //     new MaterialPageRoute(builder: (context) => new RecipePage()));
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        itemCount: widget.searchResultRecipe.length,
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return SizedBox(height: 16);
        },
        itemBuilder: (context, index) {
          return RecipeTile(
            data: widget.searchResultRecipe[index],
          );
        },
      ),
    );
  }
}
