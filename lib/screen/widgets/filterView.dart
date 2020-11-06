import 'package:flutter/material.dart';

class FilterView extends StatelessWidget {
  const FilterView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          new Container(
            height: 50.00,
            width: 146.00,
            decoration: BoxDecoration(
              // color: Color(0xff00c569),
              borderRadius: BorderRadius.circular(4.00),
            ),
            child: Center(
                child: new Text(
              "No filters applied",
              style: TextStyle(
                fontFamily: "SF Pro Display",
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color(0xff000000),
              ),
            )),
          ),
          new Container(
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
              onPressed: () {},
              child: new Text(
                "FILTER",
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
      ),
    );
  }
}
