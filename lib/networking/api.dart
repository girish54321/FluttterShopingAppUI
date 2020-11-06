import 'dart:convert';
import 'package:FlutterShopingAppUI/const/appConst.dart';

import 'package:http/http.dart' as http;

class Network {
  var token;

  userLogin(postData) async {
    return await http.post(MAIN_URL + LOGIN,
        body: postData, headers: _setHeaders());
  }

  userCreateAccount(postData) async {
    return await http.post(MAIN_URL + REG,
        body: postData, headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization' : 'Bearer $token'
      };
}
