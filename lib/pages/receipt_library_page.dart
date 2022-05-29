import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:date_format/date_format.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:superapp/models/auth.dart';
import 'package:superapp/models/core/receipt_library_model.dart';
import 'package:superapp/models/core/spoon.api.dart';
import 'package:superapp/models/themes.dart';
import 'package:superapp/pages/profile_page.dart';
import 'package:superapp/models/receipt.dart';
import 'package:superapp/widgets/dottedline.dart';
import 'package:superapp/pages/receipt_scan.dart';
import 'package:superapp/pages/receipt_items.dart';

class ReceiptLibraryPage extends StatefulWidget {
  @override
  State<ReceiptLibraryPage> createState() => _ReceiptLibraryPageState();
}

class _ReceiptLibraryPageState extends State<ReceiptLibraryPage> {
  late List<ReceiptLibrary> receiptList;
  bool isLoading = true;
  List months = [
    'jan',
    'feb',
    'mar',
    'apr',
    'may',
    'jun',
    'jul',
    'aug',
    'sep',
    'oct',
    'nov',
    'dec'
  ];

  @override
  void initState() {
    getReceipt(idAuth!, accessToken!);
    super.initState();
  }

  Future<void> getReceipt(int id, String apiKey) async {
    receiptList = await SpoonRecipeAPI.getUserReceipt(id, apiKey);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final icon = CupertinoIcons.moon_stars;

    ThemeMode check() {
      ThemeMode themeMode = EasyDynamicTheme.of(context).themeMode!;
      print(themeMode);
      return themeMode;
    }

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text('Receipify',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
                fontSize: 20)),
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
      body: (isLoading == false && receiptList.length != 0)
          ? SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(
                    // dotted line
                    child: Positioned(
                      top: 0,
                      bottom: 0,
                      left: 40,
                      child: DottedLine(),
                    ),
                  ),
                  // dates
                  Container(
                    padding: EdgeInsets.only(left: 12, right: 10, top: 30),
                    child: Positioned(
                      top: 30,
                      left: 10,
                      right: 0,
                      child: Container(
                        //padding: EdgeInsets.only(right: 200),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: check() == ThemeMode.dark
                              ? Colors.white
                              : MyThemes.primary,
                          borderRadius: BorderRadius.circular(15),
                          // boxShadow: [
                          //   BoxShadow(
                          //       color: Colors.black.withOpacity(0.1),
                          //       blurRadius: 4,
                          //       spreadRadius: 2)
                          // ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              receiptList[0].created!.day.toString(),
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              formatDate(receiptList[0].created!, [M])
                                  .toUpperCase(),
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.only(left: 12, right: 10, top: 330),
                  //   child: Positioned(
                  //     top: 30,
                  //     left: 10,
                  //     right: 0,
                  //     child: Container(
                  //       //padding: EdgeInsets.only(right: 200),
                  //       height: 60,
                  //       width: 60,
                  //       decoration: BoxDecoration(
                  //         color: Color(0xFF76C79E),
                  //         borderRadius: BorderRadius.circular(15),
                  //         // boxShadow: [
                  //         //   BoxShadow(
                  //         //       color: Colors.black.withOpacity(0.1),
                  //         //       blurRadius: 4,
                  //         //       spreadRadius: 2)
                  //         // ],
                  //       ),
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: <Widget>[
                  //           Text(
                  //             '01',
                  //             style: TextStyle(
                  //                 color: Colors.grey[800],
                  //                 fontSize: 27,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //           Text(
                  //             'Oct',
                  //             style: TextStyle(
                  //                 color: Colors.grey[800],
                  //                 fontSize: 14,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.only(left: 12, right: 10, top: 630),
                  //   child: Positioned(
                  //     top: 30,
                  //     left: 10,
                  //     right: 0,
                  //     child: Container(
                  //       //padding: EdgeInsets.only(right: 200),
                  //       height: 60,
                  //       width: 60,
                  //       decoration: BoxDecoration(
                  //         color: Color(0xFF76C79E),
                  //         borderRadius: BorderRadius.circular(15),
                  //         // boxShadow: [
                  //         //   BoxShadow(
                  //         //       color: Colors.black.withOpacity(0.1),
                  //         //       blurRadius: 4,
                  //         //       spreadRadius: 2)
                  //         // ],
                  //       ),
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: <Widget>[
                  //           Text(
                  //             '29',
                  //             style: TextStyle(
                  //                 color: Colors.grey[800],
                  //                 fontSize: 27,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //           Text(
                  //             'Sept',
                  //             style: TextStyle(
                  //                 color: Colors.grey[800],
                  //                 fontSize: 14,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .stretch, // force all text to take available width of the column
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 85, top: 30),
                          height: 300,
                          child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: receiptList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1.6,
                                crossAxisCount: 1,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      //
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ReceiptScan(
                                                    image: receiptList[index]
                                                        .image!,
                                                    receiptItems:
                                                        receiptList[index]
                                                            .ingredients!
                                                            .split(','),
                                                  )));
                                    });
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(bottom: 10, right: 10),
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //       color: Theme.of(context).shadowColor,
                                      //       blurRadius: 4,
                                      //       spreadRadius: 2)
                                      // ],
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          formatDate(
                                              receiptList[index].created!,
                                              [HH, ':', nn]),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              // color: Theme.of(context)
                                              //     .dividerColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 8),
                                        Container(
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                height: 200,
                                                width: 120,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            receiptList[index]
                                                                .image!),
                                                        fit: BoxFit.cover)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })),
                      // Container(
                      //     padding: EdgeInsets.only(left: 85, top: 30),
                      //     height: 300,
                      //     child: GridView.builder(
                      //         scrollDirection: Axis.horizontal,
                      //         itemCount: receipt.length,
                      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //           childAspectRatio: 1.6,
                      //           crossAxisCount: 1,
                      //         ),
                      //         itemBuilder: (BuildContext context, int index) {
                      //           return InkWell(
                      //             onTap: () {
                      //               setState(() {
                      //                 //
                      //                 Navigator.push(
                      //                     context,
                      //                     MaterialPageRoute(
                      //                         builder: (context) => ReceiptScan()));
                      //               });
                      //             },
                      //             child: Container(
                      //               margin: EdgeInsets.only(bottom: 10, right: 10),
                      //               padding: EdgeInsets.all(15),
                      //               decoration: BoxDecoration(
                      //                 color:
                      //                     Theme.of(context).scaffoldBackgroundColor,
                      //                 // boxShadow: [
                      //                 //   BoxShadow(
                      //                 //       color: Colors.black.withOpacity(0.1),
                      //                 //       blurRadius: 4,
                      //                 //       spreadRadius: 2)
                      //                 // ],
                      //               ),
                      //               child: Column(
                      //                 children: <Widget>[
                      //                   Text(
                      //                     receipt[index].title,
                      //                     textAlign: TextAlign.center,
                      //                     style: TextStyle(
                      //                         color: Theme.of(context).dividerColor,
                      //                         fontSize: 14,
                      //                         fontWeight: FontWeight.w600),
                      //                   ),
                      //                   Container(
                      //                     child: Column(
                      //                       children: <Widget>[
                      //                         Container(
                      //                           height: 200,
                      //                           width: 120,
                      //                           decoration: BoxDecoration(
                      //                               borderRadius:
                      //                                   BorderRadius.circular(4),
                      //                               image: DecorationImage(
                      //                                   image: NetworkImage(
                      //                                       receipt[index].image),
                      //                                   fit: BoxFit.cover)),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           );
                      //         })),
                      // Container(
                      //     padding: EdgeInsets.only(left: 85, top: 30),
                      //     height: 300,
                      //     child: GridView.builder(
                      //         scrollDirection: Axis.horizontal,
                      //         itemCount: receipt.length,
                      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //           childAspectRatio: 1.6,
                      //           crossAxisCount: 1,
                      //         ),
                      //         itemBuilder: (BuildContext context, int index) {
                      //           return InkWell(
                      //             onTap: () {
                      //               setState(() {
                      //                 //
                      //                 Navigator.push(
                      //                     context,
                      //                     MaterialPageRoute(
                      //                         builder: (context) => ReceiptScan()));
                      //               });
                      //             },
                      //             child: Container(
                      //               margin: EdgeInsets.only(bottom: 10, right: 10),
                      //               padding: EdgeInsets.all(15),
                      //               decoration: BoxDecoration(
                      //                 color:
                      //                     Theme.of(context).scaffoldBackgroundColor,
                      //                 // boxShadow: [
                      //                 //   BoxShadow(
                      //                 //       color: Colors.black.withOpacity(0.1),
                      //                 //       blurRadius: 4,
                      //                 //       spreadRadius: 2)
                      //                 // ],
                      //               ),
                      //               child: Column(
                      //                 children: <Widget>[
                      //                   Text(
                      //                     receipt[index].title,
                      //                     textAlign: TextAlign.center,
                      //                     style: TextStyle(
                      //                         color: Theme.of(context).dividerColor,
                      //                         fontSize: 14,
                      //                         fontWeight: FontWeight.w600),
                      //                   ),
                      //                   Container(
                      //                     child: Column(
                      //                       children: <Widget>[
                      //                         Container(
                      //                           height: 200,
                      //                           width: 120,
                      //                           decoration: BoxDecoration(
                      //                               borderRadius:
                      //                                   BorderRadius.circular(4),
                      //                               image: DecorationImage(
                      //                                   image: NetworkImage(
                      //                                       receipt[index].image),
                      //                                   fit: BoxFit.cover)),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           );
                      //         })),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          : Center(
              child: Text(
                "You haven't scanned any receipts",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}
