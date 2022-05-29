import 'package:flutter/material.dart';
import 'package:superapp/utils/app_color.dart';

class ItemButton extends StatefulWidget {
  final String ingredients_name;
  final bool? fromSearch;
  final Function addOrRemove;

  const ItemButton(
      {Key? key,
      required this.ingredients_name,
      this.fromSearch,
      required this.addOrRemove})
      : super(key: key);

  @override
  State<ItemButton> createState() => _ItemButtonState();
}

class _ItemButtonState extends State<ItemButton> {
  bool _flag = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (() {
        widget.addOrRemove(widget.ingredients_name);
        setState(() {
          _flag = !_flag;
        });
      }),
      child: Text(
        widget.ingredients_name,
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        primary: _flag ? AppColor.primary : AppColor.untickedBox,
        onPrimary: _flag ? AppColor.whiteText : AppColor.greyText,
      ),
    );
  }
}
