import 'package:FlutterShopingAppUI/provider/loginState.dart';
import 'package:FlutterShopingAppUI/screen/auth/singInScreen/singInScreen.dart';
import 'package:FlutterShopingAppUI/screen/homeScreen/homemain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginStateProvider>(
            create: (context) => LoginStateProvider()),
      ],
      child: Consumer<LoginStateProvider>(
        builder: (context, loginStateProvider, child) {
          return MaterialApp(
              title: 'Shoping',
              theme: ThemeData(
                  primarySwatch: Colors.green,
                  scaffoldBackgroundColor: Colors.white,
                  fontFamily: 'SF Pro Display'),
              home: loginStateProvider.logedIn == true
                  ? HomeMainScreen()
                  : SingInScreen());
        },
      ),
    );
  }
}
