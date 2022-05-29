import 'package:flutter/material.dart';
import 'package:superapp/models/core/recipe.dart';
import 'package:superapp/models/core/recipeapi.dart';

class IngTile extends StatelessWidget {
  final Ingredients data;
  IngTile({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade300, width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 9,
            child: Text(
              data.wholeLine as String,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w600, height: 150 / 100),
            ),
          ),
          // Flexible(
          //   flex: 3,
          //   child: Text(
          //     data.size as String,
          //     style: TextStyle(
          //         fontSize: 16,
          //         fontWeight: FontWeight.w700,
          //         fontFamily: 'Montserrat',
          //         color: Colors.grey[600]),
          //   ),
          // ),
        ],
      ),
    );
  }
}
