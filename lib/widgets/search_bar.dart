import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final List<String> ingredientsName;
  final List<String> addedItems;
  final Function addOrRemove;

  DataSearch(
      {required this.ingredientsName,
      required this.addOrRemove,
      required this.addedItems});

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
    // Show results based on the selection
    final List<String> allResults = ingredientsName
        .where(
          (singleElement) => singleElement.contains(
            query.toLowerCase(),
          ),
        )
        .toList();

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return ListView.builder(
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              query = allResults[index];
            },
            title: Text(allResults[index]),
            leading: Icon(Icons.kitchen),
            trailing: IconButton(
              onPressed: () {
                setState(
                  () {
                    addOrRemove(allResults[index]);
                  },
                );
              },
              icon: addedItems.contains(allResults[index])
                  ? Icon(Icons.remove)
                  : Icon(Icons.add),
            ),
          ),
          itemCount: allResults.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> allResults = ingredientsName
        .where(
          (singleElement) => singleElement.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return ListView.builder(
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              query = allResults[index];
            },
            title: Text(allResults[index]),
            leading: Icon(Icons.kitchen),
            trailing: IconButton(
              onPressed: () {
                setState(
                  () {
                    addOrRemove(allResults[index]);
                  },
                );
              },
              icon: addedItems.contains(allResults[index])
                  ? Icon(Icons.remove)
                  : Icon(Icons.add),
            ),
          ),
          itemCount: allResults.length,
        );
      },
    );
  }
}
