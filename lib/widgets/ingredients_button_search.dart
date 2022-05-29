import 'package:flutter/material.dart';
import 'package:superapp/utils/app_color.dart';
import 'package:superapp/utils/string_extension.dart';

class ItemButtonSearch extends StatefulWidget {
  final String ingredients_name;
  final bool? fromSearch;
  final Function addOrRemove;
  final List<String> selectedItems;

  const ItemButtonSearch(
      {Key? key,
      required this.ingredients_name,
      this.fromSearch,
      required this.addOrRemove,
      required this.selectedItems})
      : super(key: key);

  @override
  State<ItemButtonSearch> createState() => _ItemButtonSearchState();
}

class _ItemButtonSearchState extends State<ItemButtonSearch> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (() {
        widget.addOrRemove(widget.ingredients_name);
      }),
      child: Text(
        widget.ingredients_name.capitalize(),
        style: const TextStyle(fontFamily: 'Montserrat'),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        primary: widget.selectedItems.contains(widget.ingredients_name)
            ? AppColor.primary
            : AppColor.untickedBox,
        onPrimary: widget.selectedItems.contains(widget.ingredients_name)
            ? AppColor.whiteText
            : AppColor.greyText,
      ),
    );
  }
}
