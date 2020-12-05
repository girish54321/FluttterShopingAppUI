import 'package:flutter/material.dart';

class ToolBarText extends StatelessWidget {
  final String toolBarText;
  const ToolBarText({Key key, this.toolBarText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      toolBarText,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: Color(0xff000000),
      ),
    );
  }
}
