import 'package:flutter/material.dart';

class CheckOutControls extends StatelessWidget {
  final Function changeIndex;
  final Function goBack;
  final String buttonText;
  final int selectedIndex;

  const CheckOutControls(
      {Key key,
      this.changeIndex,
      this.selectedIndex,
      this.goBack,
      this.buttonText})
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
              color: Colors.white,
              border:
                  Border.all(width: 1.00, color: Theme.of(context).accentColor),
              borderRadius: BorderRadius.circular(4.00),
            ),
            child: FlatButton(
              // color: Theme.of(context).accentColor,
              splashColor: Theme.of(context).accentColor,
              highlightColor: Theme.of(context).accentColor,
              onPressed: () {
                goBack();
              },
              child: new Text(
                "BACK",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "SF Pro Text",
                  fontSize: 14,
                ),
              ),
            ),
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
                // print("CHCHC");
                changeIndex();
              },
              child: new Text(
                buttonText != null ? buttonText : "NEXT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "SF Pro Text",
                  fontSize: 14,
                  color: Color(0xffffffff),
                ),
              ),
            ),
          )
        ],
        // ),
      ),
    );
  }
}
