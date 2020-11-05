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
        fontFamily: "SF Pro Display",
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

// AppBar header(context,
//     {bool isAppTitle = false, String titleText, removeBackButton = false}) {
//   return AppBar(
//     automaticallyImplyLeading: removeBackButton ? false : true,
//     title: Text(
//       isAppTitle ? "FlutterShare" : titleText,
//       style: TextStyle(
//         color: Colors.white,
//         fontFamily: isAppTitle ? "Signatra" : "",
//         fontSize: isAppTitle ? 50.0 : 22.0,
//       ),
//     ),
//     centerTitle: true,
//     backgroundColor: Theme.of(context).accentColor,
//   );
// }
