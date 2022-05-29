import 'package:flutter/material.dart';
import 'package:superapp/utils/string_extension.dart';
import 'package:superapp/pages/receipt_scan.dart';

class receiptItemList extends StatefulWidget {
  final List<String> itemName;

  receiptItemList({Key? key, required this.itemName}) : super(key: key);

  @override
  State<receiptItemList> createState() => _receiptItemListState();
}

class _receiptItemListState extends State<receiptItemList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Scrollbar(
        isAlwaysShown: true,
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => ListTile(
            title: Text(
              widget.itemName[index].capitalize(),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Montserrat'),
            ),
          ),
          separatorBuilder: (context, index) {
            return const Divider(
              height: 1,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            );
          },
          itemCount: widget.itemName.length,
        ),
      ),
    );
  }
}
