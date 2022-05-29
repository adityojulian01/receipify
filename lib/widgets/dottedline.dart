import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeMode check() {
      ThemeMode themeMode = EasyDynamicTheme.of(context).themeMode!;
      print(themeMode);
      return themeMode;
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxHeight = constraints.constrainHeight();
        final lineHeight = 10.0;
        final lineWidth = 2.0;
        final lineCount = 15;
        //final lineCount = (boxHeight / (lineHeight + 2.0)).floor();
        return Flex(
          direction: Axis.vertical,
          children: List.generate(lineCount, (_) {
            return Column(
              children: <Widget>[
                SizedBox(
                  height: lineHeight,
                  width: lineWidth,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: check() == ThemeMode.dark
                              ? Colors.white
                              : Color(0xFF76C79E))),
                ),
                SizedBox(
                  height: lineHeight,
                  width: lineWidth,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor)),
                ),
              ],
            );
          }),
        );
      },
    );
  }
}
