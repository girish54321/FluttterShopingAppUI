import 'dart:convert';

import 'package:FlutterShopingAppUI/const/appConst.dart';
import 'package:FlutterShopingAppUI/helper/helper.dart';
import 'package:FlutterShopingAppUI/modal/loginModal/loginError.dart';
import 'package:FlutterShopingAppUI/networking/api.dart';
import 'package:FlutterShopingAppUI/screen/auth/singInScreen/signInUi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SingInScreen extends StatefulWidget {
  SingInScreen({Key key}) : super(key: key);

  @override
  _SingInScreenState createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  userLogin(changeLoginState) async {
    try {
      await Helper().showLoadingDilog(context).show();
      var postData = {
        "email": "eve.holt@reqres.in",
        "password": "cityslicka",
      };
      http.Response response = await Network().userLogin(jsonEncode(postData));
      print(response.body);
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
      Helper().vibratPhone();
      await Helper().showLoadingDilog(context).hide();
      Helper().showSnackBar("", "Error", context, true);
    }
  }

  saveUserLocaly(changeLoginState) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(LOGIN, true);
    await prefs.setString(EMAIL, emailController.text.trim());
    changeLoginState(true);
  }

  @override
  Widget build(BuildContext context) {
    return SignInUi(
      emailController: emailController,
      passwordController: passwordController,
      userLogin: userLogin,
    );
  }
}
