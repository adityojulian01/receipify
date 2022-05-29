import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:superapp/models/auth.dart';
import 'package:superapp/models/core/login_model.dart';
import 'package:superapp/models/core/login_token.dart';
import 'package:superapp/models/core/register_model.dart';
import 'package:superapp/models/core/spoon.api.dart';
import 'package:superapp/pages/pre_ingredients.dart';
import 'package:superapp/utils/app_color.dart';

import 'navbar_home.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late LoginModel? loginModel;
  LoginModel? userDetails;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loginModel = new LoginModel();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ProgressHUD(
  //     child: _uiSetup(context),
  //     inAsyncCall: isApiCallProcess,
  //     opacity: 0.3,
  //   );
  // }
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColor.primary,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              color: AppColor.greyText,
                              fontFamily: 'Montserrat',
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (input) => loginModel?.username = input,
                          decoration: InputDecoration(
                            hintText: "Username",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColor.primary.withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor.primary)),
                            prefixIcon: Icon(
                              Icons.person,
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => loginModel?.email = input,
                          // validator: (input) => input!.contains('@')
                          //     ? "Email Id should be valid"
                          //     : null,
                          decoration: InputDecoration(
                            hintText: "Email Address",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(color: AppColor.greyText),
                          keyboardType: TextInputType.text,
                          onSaved: (input) => loginModel?.password = input,
                          validator: (input) => input!.length < 3
                              ? "Password should be more than 3 characters"
                              : null,
                          obscureText: hidePassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColor.primary.withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor.primary)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppColor.primary,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: AppColor.primary.withOpacity(0.4),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                          onPressed: () async {
                            if (validateAndSave()) {
                              print(loginModel!.toJson());
                              setState(() {
                                isApiCallProcess = true;
                              });

                              userDetails = await SpoonRecipeAPI.registerUser(
                                  loginModel!.username,
                                  loginModel!.email,
                                  loginModel!.password);

                              LoginToken userModel =
                                  await SpoonRecipeAPI.getLoginToken(
                                      loginModel!.username,
                                      loginModel!.password);

                              accessToken = userModel.access!;

                              Map<String, dynamic> user =
                                  Jwt.parseJwt(userModel.access!);

                              print(user);

                              print('user details ${user['user_id']}');
                              if (user['user_id'] != null) {
                                // print(userDetails!.id);
                                // print(userDetails!.username);
                                // print(userDetails!.email);

                                idAuth = user['user_id'];
                                userNameAuth = user['username'];
                                emailAuth = user['email'];
                                await SpoonRecipeAPI.createUser(idAuth, '');

                                print(
                                    "global: $idAuth, $userNameAuth, $emailAuth");

                                setState(() {
                                  isApiCallProcess = false;
                                });
                                final snackBar = SnackBar(
                                    content: Text('Sign Up Successfull'));
                                scaffoldKey.currentState!
                                    .showSnackBar(snackBar);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PreIngredients(),
                                  ),
                                );
                              } else {
                                final snackBar =
                                    SnackBar(content: Text('Sign Up Failed'));
                                scaffoldKey.currentState!
                                    .showSnackBar(snackBar);
                              }
                            }
                            ;
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: AppColor.primary,
                          shape: StadiumBorder(),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
