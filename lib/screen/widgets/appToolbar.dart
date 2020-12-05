import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

AppBar header(context, title) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title != null ? title : "",
      style: TextStyle(
        fontSize: 20,
        color: Color(0xff000000),
      ),
    ),
    leading: IconButton(
        icon: Icon(EvaIcons.arrowIosBack, color: Colors.black),
        onPressed: () {
          Navigator.of(context).pop();
        }),
  );
}
