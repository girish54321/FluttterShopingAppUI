import 'dart:convert';

import 'package:FlutterShopingAppUI/const/appConst.dart';
import 'package:FlutterShopingAppUI/helper/helper.dart';
import 'package:FlutterShopingAppUI/modal/loginModal/loginError.dart';
import 'package:FlutterShopingAppUI/networking/api.dart';
import 'package:FlutterShopingAppUI/screen/auth/singUpScreen/signUpUi.dart';
import 'package:FlutterShopingAppUI/screen/homeScreen/homemain.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SingUpScreen extends StatefulWidget {
  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  userCreateAccount(changeLoginState) async {
    try {
      await Helper().showLoadingDilog(context).show();
      var postData = {
        "email": "eve.holt@reqres.in",
        "password": "cityslicka",
      };
      http.Response response =
          await Network().userCreateAccount(jsonEncode(postData));
      print(response.statusCode);
      var resCode = response.statusCode;
      if (resCode == 200) {
        await Helper().showLoadingDilog(context).hide();
        saveUserLocaly(changeLoginState);
      } else {
        Helper().vibratPhone();
        await Helper().showLoadingDilog(context).hide();
        LoginError loginError =
            new LoginError.fromJson(json.decode(response.body));
        Helper().showSnackBar(loginError.error, "Error", context, true);
      }
    } catch (e) {
      await Helper().showLoadingDilog(context).hide();
      Helper().vibratPhone();
      Helper().showSnackBar("loginError", "Error", context, true);
    }
  }

  saveUserLocaly(changeLoginState) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(LOGIN, true);
    await prefs.setString(EMAIL, emailController.text.trim());
    changeLoginState(true);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => HomeMainScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingUpUi(
        passwordController: passwordController,
        userNameController: userNameController,
        emailController: emailController,
        userCreateAccount: userCreateAccount);
  }
}
