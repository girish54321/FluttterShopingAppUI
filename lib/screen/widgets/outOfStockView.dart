import 'package:flutter/material.dart';

class OutOfStockView extends StatelessWidget {
  const OutOfStockView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // right: 1,
      left: 1,
      child: Container(
        margin: EdgeInsets.all(6),
        height: 30.00,
        width: 90.00,
        decoration: BoxDecoration(
          color: Color(0xffffb900),
          borderRadius: BorderRadius.circular(2.00),
        ),
        child: Center(
          child: Text(
            "Out of Stock",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "SF Pro Display",
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xffffffff),
            ),
          ),
        ),
      ),
    );
  }
}
