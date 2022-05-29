//import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superapp/models/auth.dart';
import 'package:superapp/models/core/spoon.api.dart';
import 'package:superapp/models/themes.dart';
import 'package:superapp/pages/edit_profile_page.dart';
import 'package:superapp/models/user.dart';
//import 'package:receipify_dummy/utils/themes.dart';
import 'package:superapp/pages/receipt_library_page.dart';
import 'package:superapp/pages/sign_in_page.dart';
import 'package:superapp/utils/user_preferences.dart';
import 'package:superapp/widgets/numbers_widget.dart';
import 'package:superapp/widgets/profile_widget.dart';

import '../models/core/receipt_library_model.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late List<ReceiptLibrary> receiptList;
  bool isLoading = true;

  ThemeMode check() {
    ThemeMode themeMode = EasyDynamicTheme.of(context).themeMode!;
    print(themeMode);
    return themeMode;
  }

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
    final user = UserPreferences.myUser;
    //final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => EasyDynamicTheme.of(context).changeTheme(),
              icon: const Icon(CupertinoIcons.moon_stars))
        ],
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text('Profile',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
                fontSize: 20)),
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ReceiptLibraryPage()),
            );
          },
        ),
        // actions: [
        //   IconButton(
        //     color: Colors.white,
        //     icon: Icon(CupertinoIcons.moon_stars),
        //     onPressed: () {
        //       final theme =
        //           isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;
        //       final switcher = ThemeSwitcher.of(context);
        //       switcher?.changeTheme(theme: theme);
        //     },
        //   ),
        // ],
      ),
      body: Column(
        // physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 50),
          // ProfileWidget(
          //   image: user.image,
          //   onClicked: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => EditProfilePage()),
          //     );
          //   },
          // ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          isLoading == true
              ? Align(
                  child: CircularProgressIndicator(),
                  alignment: Alignment.center)
              : NumbersWidget(number: receiptList.length),
          const SizedBox(height: 30),
          // buildUserData(user),
          const SizedBox(height: 24),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  primary: check() == ThemeMode.system
                      ? MyThemes.primary
                      : Theme.of(context).dividerColor),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignInPage(),
                  ),
                );
              },
              child: Text(
                'Logout',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: check() == ThemeMode.system
                        ? Colors.white
                        : Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            userNameAuth!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            emailAuth!,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUserData(User user) => Container(
        margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
        ),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color:
                      check() == ThemeMode.dark ? Colors.black : Colors.black),
            ),
            const SizedBox(height: 4),
            Text(
              userNameAuth!,
              style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  color:
                      check() == ThemeMode.dark ? Colors.black : Colors.black),
            ),
            const SizedBox(height: 15),
            Text(
              'Email Address',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color:
                      check() == ThemeMode.dark ? Colors.black : Colors.black),
            ),
            const SizedBox(height: 4),
            Text(
              emailAuth!,
              style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  color:
                      check() == ThemeMode.dark ? Colors.black : Colors.black),
            ),
            // const SizedBox(height: 15),
            // Text(
            //   'Date of Birth',
            //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(height: 4),
            // Text(
            //   user.dob,
            //   style: TextStyle(fontSize: 16, height: 1.4),
            // ),
          ],
        ),
      );
}
