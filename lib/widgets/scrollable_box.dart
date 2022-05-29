import 'package:flutter/material.dart';
import 'package:superapp/utils/app_color.dart';
import 'package:superapp/widgets/ingredients_button_search.dart';

class ScrollableList extends StatefulWidget {
  // final List<Map<String, Object>> ingredients;
  final List<String> itemName;
  final List<String> mostCommonItem;
  final List<String> selectedItems;
  final Function addingItem;

  ScrollableList(
      {Key? key,
      required this.itemName,
      required this.addingItem,
      required this.mostCommonItem,
      required this.selectedItems})
      : super(key: key);

  @override
  State<ScrollableList> createState() => _ScrollableListState();
}

class _ScrollableListState extends State<ScrollableList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Wrap(
                      spacing: 15,
                      runSpacing: 10,
                      children: [
                        // ...(widget.item as List<Map<String, Object>>)
                        //     .map(
                        //   (item) {
                        //     return ItemButton(
                        //         addOrRemove: widget.addingItem,
                        //         ingredients_name: item['text'] as String);
                        //   },
                        // ).toList()
                        ...(widget.itemName as List<String>).map(
                          (item) {
                            return ItemButtonSearch(
                                addOrRemove: widget.addingItem,
                                selectedItems: widget.selectedItems,
                                ingredients_name: item as String);
                          },
                        ).toList(),
                        ...(widget.mostCommonItem as List<String>).map(
                          (mostCommonItem) {
                            return ItemButtonSearch(
                                addOrRemove: widget.addingItem,
                                selectedItems: widget.selectedItems,
                                ingredients_name: mostCommonItem as String);
                          },
                        ).toList()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: AppColor.greyBox,
      ),
    );
  }
}
