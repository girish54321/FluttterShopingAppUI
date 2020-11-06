import 'package:FlutterShopingAppUI/screen/widgets/appToolbar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class FlitterView extends StatefulWidget {
  @override
  _FlitterViewState createState() => _FlitterViewState();
}

class _FlitterViewState extends State<FlitterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, "Filter"),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: <Widget>[
            ExpansionTile(
              subtitle: Text(
                "No Setting",
                style: TextStyle(
                  fontFamily: "SF Pro Display",
                  fontSize: 12,
                  color: Color(0xff000000).withOpacity(0.60),
                ),
              ),
              title: Text(
                "Popularity",
                style: TextStyle(
                  fontFamily: "SF Pro Display",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color(0xff000000),
                ),
              ),
              children: <Widget>[
                ListTile(
                  title: Text('data'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
