import 'package:flutter/material.dart';
import 'package:superapp/pages/navbar_home.dart';
import 'package:superapp/utils/app_color.dart';

class SkipButton extends StatelessWidget {
  final Widget nextPage;

  const SkipButton({Key? key, required this.nextPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 239,
      child: TextButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => nextPage)),
        child: const Text(
          'SKIP FOR NOW',
          style: TextStyle(
              color: AppColor.primary,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat'),
        ),
      ),
    );
  }
}
