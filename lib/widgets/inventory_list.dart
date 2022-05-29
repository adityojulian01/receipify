import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:superapp/models/themes.dart';
import 'package:superapp/utils/string_extension.dart';

class InventoryList extends StatefulWidget {
  final List<String> inventoryItems;
  final Function removeItem;

  const InventoryList(
      {Key? key, required this.inventoryItems, required this.removeItem})
      : super(key: key);

  @override
  State<InventoryList> createState() => _InventoryListState();
}

class _InventoryListState extends State<InventoryList> {
  ThemeMode check() {
    ThemeMode themeMode = EasyDynamicTheme.of(context).themeMode!;
    print(themeMode);
    return themeMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        thumbVisibility: true,
        child: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  visualDensity: VisualDensity(vertical: -3),
                  //contentPadding: EdgeInsets.only(top: 2),
                  title: Text(
                    widget.inventoryItems[index].capitalize(),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Montserrat',
                        color: check() == ThemeMode.dark
                            ? MyThemes.lightTheme.dividerColor
                            : Colors.black),
                  ),
                  trailing: IconButton(
                    onPressed: () =>
                        widget.removeItem(widget.inventoryItems[index]),
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ),
                  ),
                ),
            separatorBuilder: (context, index) {
              return const Divider(
                height: 0,
                thickness: 1,
                indent: 5,
                endIndent: 10,
                color: Colors.grey,
              );
            },
            itemCount: widget.inventoryItems.length));
  }
}
