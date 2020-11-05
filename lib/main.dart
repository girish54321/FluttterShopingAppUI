import 'package:FlutterShopingAppUI/screen/savedCard/savedCards.dart';
import 'package:FlutterShopingAppUI/screen/singInScreen/singInScreen.dart';
import 'package:FlutterShopingAppUI/screen/wishList/wishListScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shoping',
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SingInScreen());
    // home: SavedCardsScreen());
    // home: TimelinePage(title: 'Muslim Civilisation Doodles'));
  }
}
