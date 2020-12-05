import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ProfileSettingItems extends StatelessWidget {
  final String title;
  final Widget iconData;
  final Function function;

  const ProfileSettingItems({Key key, this.title, this.iconData, this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: function,
      leading: iconData,
      trailing: Icon(EvaIcons.arrowIosForward, color: Colors.black),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: Color(0xff000000),
        ),
      ),
    );
  }
}
