import 'package:flutter/material.dart';

class CheckOutAddToCartView extends StatelessWidget {
  final String buttonText;
  final String price;
  final Function function;

  const CheckOutAddToCartView(
      {Key key, @required this.buttonText, this.function, this.price})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50.00,
            width: 146.00,
            decoration: BoxDecoration(
              // color: Color(0xff00c569),
              borderRadius: BorderRadius.circular(4.00),
            ),
            child: price != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "PRICE",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff929292),
                        ),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xff00c569),
                        ),
                      )
                    ],
                  )
                : Text(""),
          ),
          Container(
            height: 50.00,
            width: 146.00,
            decoration: BoxDecoration(
              color: Color(0xff00c569),
              borderRadius: BorderRadius.circular(4.00),
            ),
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              splashColor: Colors.white,
              highlightColor: Theme.of(context).accentColor,
              onPressed: () {
                function();
              },
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffffffff),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
