import 'package:flutter/material.dart';
import 'package:superapp/widgets/ingredients_button.dart';
import 'package:superapp/utils/string_extension.dart';

class ScannedItemList extends StatefulWidget {
  final List<String> itemName;
  final Function removeItem;

  ScannedItemList({Key? key, required this.itemName, required this.removeItem})
      : super(key: key);

  @override
  State<ScannedItemList> createState() => _ScannedItemListState();
}

class _ScannedItemListState extends State<ScannedItemList> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            widget.itemName[index].capitalize(),
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat'),
          ),
          trailing: IconButton(
            onPressed: () => widget.removeItem(widget.itemName[index]),
            icon: Icon(Icons.cancel, color: Colors.red),
          ),
        ),
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          );
        },
        itemCount: widget.itemName.length,
      ),
    );
  }
}
