import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superapp/assets/ingredients.dart';
import 'package:superapp/models/receipt.dart';
import 'package:superapp/models/themes.dart';
import 'package:superapp/pages/receipt_items.dart';
import 'package:superapp/utils/app_color.dart';

class ReceiptScan extends StatefulWidget {
  List<String> receiptItems;
  String image;
  //final List<String> selectedItem;
  ReceiptScan({Key? key, required this.receiptItems, required this.image})
      : super(key: key);

  @override
  State<ReceiptScan> createState() => _ReceiptScanState();
}

class _ReceiptScanState extends State<ReceiptScan> {
  //late List<String> combinedItems = receiptItems + widget.selectedItem;
  //late List<String> combinedWithoutDup = combinedItems.toSet().toList();
  late List<String> items = widget.receiptItems;

  @override
  // final receiptItems = receipt[0].ingredients.split(",");

  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final icon = CupertinoIcons.moon_stars;
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          //brightness: Brightness.dark,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          centerTitle: true,
          title: const Text('Receipt Library',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w800,
                  fontSize: 20)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            ThemeSwitcher(
              builder: (context) => IconButton(
                color: Colors.white,
                icon: Icon(CupertinoIcons.moon_stars),
                onPressed: () {
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(builder: (context) => ProfilePage()),
                  // );
                  final theme =
                      isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;
                  final switcher = ThemeSwitcher.of(context);
                  switcher.changeTheme(theme: theme);
                },
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            TabBar(
              // controller: _tabController,
              // onTap: (index) {
              //   setState(() {
              //     _tabController?.index = index;
              //   });
              // },
              // labelColor: Colors.black,
              // unselectedLabelColor: Colors.black.withOpacity(0.3),
              // labelStyle: TextStyle(
              //     fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
              // indicatorColor: Colors.black,
              // tabs: [
              //   Tab(
              //     text: 'Image',
              //   ),
              //   Tab(
              //     text: 'Items',
              //   ),
              // ],
              labelColor: AppColor.greyText,
              unselectedLabelColor: Theme.of(context).dividerColor,
              labelStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              indicatorColor: Theme.of(context).dividerColor,
              tabs: [
                Tab(
                  text: 'Image',
                ),
                Tab(
                  text: 'Items',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.image),
                            fit: BoxFit.fill)),
                    child: Container(
                        decoration: BoxDecoration(color: Colors.transparent),
                        height: 280,
                        width: 280)),
                Container(
                  alignment: Alignment.topCenter,
                  width: size.width - 47,
                  height: size.height - 350,
                  margin: const EdgeInsets.fromLTRB(30, 30, 30, 80),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350]),
                  child: receiptItemList(itemName: items),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
