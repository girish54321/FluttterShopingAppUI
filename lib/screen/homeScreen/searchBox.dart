import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        margin: EdgeInsets.only(top: 12.0),
        height: 45,
        width: double.infinity,
        child: TextField(
          autofocus: false,
          style: TextStyle(color: Color(0xFFbdc6cf)),
          decoration: InputDecoration(
            prefixIcon: Icon(EvaIcons.search, color: Colors.black54),
            filled: true,
            fillColor: Colors.grey[300],
            hintText: 'Search Product',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(45.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(45.0),
            ),
          ),
        ),
      ),
      trailing: Container(
        margin: EdgeInsets.only(top: 8.0),
        child: ClipOval(
          child: Material(
            color: Theme.of(context).accentColor,
            child: InkWell(
              splashColor: Colors.white,
              child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(
                    EvaIcons.cameraOutline,
                    color: Colors.white,
                  )),
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}
