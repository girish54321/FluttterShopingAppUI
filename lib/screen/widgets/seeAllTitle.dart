import 'package:flutter/material.dart';

class SeeAppTitle extends StatelessWidget {
  final String title;
  // final
  const SeeAppTitle({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 26, left: 16, right: 16, bottom: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          new Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Color(0xff000000),
            ),
          ),
          new Text(
            "See all",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff000000),
            ),
          )
        ],
      ),
    );
  }
}
