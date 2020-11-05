import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helper {
  showToastMessage(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showSnackBar(message, title, context, bool error) {
    return Flushbar(
      title: title,
      message: message,
      backgroundColor: error ? Colors.orange : Theme.of(context).accentColor,
      reverseAnimationCurve: Curves.easeIn,
      forwardAnimationCurve: Curves.easeInOut,
      duration: Duration(seconds: 5),
      margin: EdgeInsets.all(8),
      borderRadius: 8,
    )..show(context);
  }

  printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }
}