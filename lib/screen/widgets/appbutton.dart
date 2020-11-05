import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final Function function;

  const AppButton({Key key, this.buttonText, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.00,
      width: double.infinity,
      decoration: BoxDecoration(
        // color: Color(0xff00c569),
        borderRadius: BorderRadius.circular(4.00),
      ),
      child: RaisedButton(
        color: Theme.of(context).accentColor,
        splashColor: Colors.white,
        highlightColor: Theme.of(context).accentColor,
        onPressed: function,
        child: new Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
