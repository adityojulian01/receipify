import 'package:flutter/material.dart';
import 'package:superapp/pages/navbar_home.dart';
import 'package:superapp/utils/app_color.dart';

class NavigatorButton extends StatelessWidget {
  final String message;
  final Widget nextPage;

  const NavigatorButton(
      {Key? key, required this.message, required this.nextPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 239,
      height: 49,
      child: ElevatedButton(
        child: Text(
          message.toUpperCase(),
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat'),
        ),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => nextPage)),
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(38)),
          primary: AppColor.primary,
        ),
      ),
    );
  }
}
