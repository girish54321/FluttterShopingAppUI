import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String title;
  final Widget icon;
  final Function function;
  const SocialLoginButton({Key key, this.title, this.icon, this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 28,
        ),
        height: 50.00,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.00,
            color: Color(0xffdddddd),
          ),
          borderRadius: BorderRadius.circular(4.00),
        ),
        // child: ListTile(
        //   leading: icon,

        // ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: icon,
            ),
            Text(
              title,
              // textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xff000000),
              ),
            ),
            Text("")
          ],
        ));
  }
}
