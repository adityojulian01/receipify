import 'package:flutter/material.dart';
import 'package:superapp/models/themes.dart';
import 'package:superapp/pages/login_page.dart';
import 'package:superapp/pages/recipe_page.dart';
import 'package:superapp/pages/pre_ingredients.dart';
import 'package:superapp/pages/register_page.dart';
import 'package:superapp/shared/authentication/or_divider.dart';
import 'package:superapp/shared/authentication/terms_of_use.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  Text(
                    "Receipify",
                    style: TextStyle(
                      color: MyThemes.primaryColor,
                      fontSize: 32,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Make recipe from your receipt.",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 300,
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 18),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: TextButton(
                      child: const Text('Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat')),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: MyThemes.lightTheme.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  OrDivider(), // the or line divider
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }, // push to sign up
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  const TermsOfUse(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
