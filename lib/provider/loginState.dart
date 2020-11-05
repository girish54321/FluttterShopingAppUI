import 'package:flutter/material.dart';

class LoginStateProvider with ChangeNotifier {
  bool logedIn = false;
  var userData;

  LoginStateProvider() {
    notifyListeners();
  }

  changeLoginState(bool state) {
    print("CHNECN USER");
    logedIn = state;
    notifyListeners();
  }
}
