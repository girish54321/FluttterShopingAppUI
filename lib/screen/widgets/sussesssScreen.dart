import 'dart:async';
import 'package:FlutterShopingAppUI/screen/homeScreen/homemain.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  Widget anim() {
    return ControlledAnimation(
      duration: Duration(milliseconds: 600),
      curve: Curves.bounceIn,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, scaleValue) {
        return Transform.scale(
          scale: scaleValue,
          alignment: Alignment.center,
          child: Container(
            height: 150,
            width: 150,
            child:
                Icon(EvaIcons.checkmarkCircle, size: 110, color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomeMainScreen(),
        ),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).accentColor,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: anim(),
        ),
      ),
    );
  }
}
