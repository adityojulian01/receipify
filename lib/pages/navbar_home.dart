import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:superapp/models/themes.dart';
import 'package:superapp/pages/inventory.dart';
import 'package:superapp/pages/profile_page.dart';
import 'package:superapp/pages/receipt_library_page.dart';
import 'package:superapp/pages/recipe_page.dart';
import 'package:superapp/pages/homepage.dart';

class NavBarHome extends StatefulWidget {
  // final List<String>? selectedItems;
  const NavBarHome({Key? key}) : super(key: key);

  @override
  State<NavBarHome> createState() => _NavBarHomeState();
}

class _NavBarHomeState extends State<NavBarHome> {
  int currentTab = 5;
  late List<Widget> screens = [
    InventoryPage(),
    ReceiptLibraryPage(),
    RecipePage(includedIngredients: ""),
    // RecipePage(includedIngredients: widget.selectedItems!.join(",")),
    ProfilePage(),
    //Other(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  late Widget currentScreen = HomePage();
  //late Widget screenInv = InventoryPage();

  @override
  Widget build(BuildContext context) {
    ThemeMode check() {
      ThemeMode themeMode = EasyDynamicTheme.of(context).themeMode!;
      print(themeMode);
      return themeMode;
    }

    return MaterialApp(
      // theme: ThemeData(primaryColor: const Color(0xFF76C79E)),
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.filter_center_focus,
            color: check() == ThemeMode.dark ? Colors.black : Colors.white,
          ),
          backgroundColor:
              check() == ThemeMode.dark ? Colors.white : MyThemes.primary,
          onPressed: () {
            setState(() {
              currentScreen = HomePage();
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentTab = 0;
                          currentScreen = screens[currentTab];
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.kitchen, color: (() {
                            if (currentTab == 0) {
                              if (check() == ThemeMode.system) {
                                return MyThemes.lightTheme.primaryColor;
                              } else {
                                return MyThemes.darkTheme.dividerColor;
                              }
                            } else {
                              return Colors.grey;
                            }
                          })()),
                          Text(
                            'Inventory',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: (() {
                                  if (currentTab == 0) {
                                    if (check() == ThemeMode.system) {
                                      return MyThemes.lightTheme.primaryColor;
                                    } else {
                                      return MyThemes.darkTheme.dividerColor;
                                    }
                                  } else {
                                    return Colors.grey;
                                  }
                                })()),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => SearchResult()),
                        setState(() {
                          currentTab = 1;
                          currentScreen = screens[currentTab];
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.receipt_long, color: (() {
                            if (currentTab == 1) {
                              if (check() == ThemeMode.system) {
                                return MyThemes.lightTheme.primaryColor;
                              } else {
                                return MyThemes.darkTheme.dividerColor;
                              }
                            } else {
                              return Colors.grey;
                            }
                          })()),
                          Text(
                            'Receipt',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: (() {
                                  if (currentTab == 1) {
                                    if (check() == ThemeMode.system) {
                                      return MyThemes.lightTheme.primaryColor;
                                    } else {
                                      return MyThemes.darkTheme.dividerColor;
                                    }
                                  } else {
                                    return Colors.grey;
                                  }
                                })()),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                //Right Tab Bar
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentTab = 2;
                          currentScreen = screens[currentTab];
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.icecream, color: (() {
                            if (currentTab == 2) {
                              if (check() == ThemeMode.system) {
                                return MyThemes.lightTheme.primaryColor;
                              } else {
                                return MyThemes.darkTheme.dividerColor;
                              }
                            } else {
                              return Colors.grey;
                            }
                          })()),
                          Text(
                            'Recipe',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: (() {
                                  if (currentTab == 2) {
                                    if (check() == ThemeMode.system) {
                                      return MyThemes.lightTheme.primaryColor;
                                    } else {
                                      return MyThemes.darkTheme.dividerColor;
                                    }
                                  } else {
                                    return Colors.grey;
                                  }
                                })()),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentTab = 3;
                          currentScreen = screens[currentTab];
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person, color: (() {
                            if (currentTab == 3) {
                              if (check() == ThemeMode.system ||
                                  check() == ThemeMode.light) {
                                return MyThemes.lightTheme.primaryColor;
                              } else {
                                return MyThemes.darkTheme.dividerColor;
                              }
                            } else {
                              return Colors.grey;
                            }
                          })()),
                          Text(
                            'Profile',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: (() {
                                  if (currentTab == 3) {
                                    if (check() == ThemeMode.system ||
                                        check() == ThemeMode.light) {
                                      return MyThemes.lightTheme.primaryColor;
                                    } else {
                                      return MyThemes.darkTheme.dividerColor;
                                    }
                                  } else {
                                    return Colors.grey;
                                  }
                                })()),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
