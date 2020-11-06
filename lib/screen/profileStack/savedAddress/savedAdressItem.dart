import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';

class SavedAddressItem extends StatelessWidget {
  final dynamic value;
  final dynamic groupValue;
  final Function function;
  final String title;
  final String subTitle;
  final Function changeDeliveryAddressType;
  final bool selected;
  const SavedAddressItem(
      {Key key,
      this.value,
      this.groupValue,
      this.function,
      @required this.title,
      @required this.subTitle,
      this.changeDeliveryAddressType,
      @required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          title: Text(
            title,
            style: TextStyle(
              height: 1.6,
              fontFamily: "SF Pro Display",
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Color(0xff000000),
            ),
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(
              height: 1.6,
              fontFamily: "SF Pro Display",
              fontSize: 14,
              color: Color(0xff000000),
            ),
          ),
          trailing: CircularCheckBox(
              value: selected,
              checkColor: Colors.white,
              activeColor: Theme.of(context).accentColor,
              inactiveColor: Colors.grey,
              disabledColor: Colors.grey,
              onChanged: (val) {
                // changeSameAdress(val);
              }),
        ),
        SizedBox(height: 12),
        Divider()
      ],
    );
  }
}
