import 'package:flutter/material.dart';

class ScrollingGrid extends StatefulWidget {
  ScrollingGrid({Key? key}) : super(key: key);

  @override
  State<ScrollingGrid> createState() => _ScrollingGridState();
}

class _ScrollingGridState extends State<ScrollingGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(20),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          child: Text('Color 1'),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text('Color 2'),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text('Color 3'),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text('Color 4'),
        )
      ],
    );
  }
}
