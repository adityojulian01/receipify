import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superapp/models/user.dart';
import 'package:superapp/widgets/textfield_widget.dart';
import 'package:superapp/utils/user_preferences.dart';
import 'package:superapp/widgets/profile_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Profile',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
                fontSize: 20),
          ),
          // actions: [
          //   IconButton(
          //     color: Colors.white,
          //     icon: Icon(CupertinoIcons.moon_stars),
          //     onPressed: () {
          //       final theme =
          //           user.isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;
          //       final switcher = ThemeSwitcher.of(context);
          //       switcher?.changeTheme(theme: theme);
          //     },
          //   ),
          // ],
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.fromLTRB(32, 30, 32, 0),
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                image: user.image,
                isEdit: true,
                onClicked: () async {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Full Name',
                text: user.name,
                onChanged: (name) {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Email',
                text: user.email,
                onChanged: (email) {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                  label: 'Username',
                  text: user.username,
                  onChanged: (username) {}),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Phone Number',
                text: user.phone,
                onChanged: (phone) {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Date of Birth',
                text: user.dob,
                onChanged: (dob) {},
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: MaterialButton(
                  height: 50,
                  onPressed: () {},
                  color: Color(0xff0095FF),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      );
}
