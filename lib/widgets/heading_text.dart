import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String headText;

  HeadingText({Key? key, required this.headText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 268,
      height: 76,
      margin: EdgeInsets.only(left: 36, top: 69),
      child: Text(
        headText,
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Montserrat'),
      ),
    );
  }
}
