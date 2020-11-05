import 'package:FlutterShopingAppUI/animasions/FadeAnimation.dart';
import 'package:flutter/material.dart';

class ProductSelction extends StatefulWidget {
  @override
  _ProductSelctionState createState() => _ProductSelctionState();
}

class _ProductSelctionState extends State<ProductSelction> {
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      0.3,
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            new Container(
              height: 40.00,
              width: 160.00,
              padding: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.00,
                  color: Color(0xffebebeb),
                ),
                borderRadius: BorderRadius.circular(25.00),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Size",
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                  ),
                  Text(
                    "XL",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 40.00,
              width: 160.00,
              padding: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.00,
                  color: Color(0xffebebeb),
                ),
                borderRadius: BorderRadius.circular(25.00),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Size",
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                  ),
                  Container(
                    height: 22.00,
                    width: 22.00,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.00),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
