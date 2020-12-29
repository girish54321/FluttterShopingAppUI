import 'package:flutter/material.dart';

class ShippingOptionItem extends StatelessWidget {
  final dynamic value;
  final dynamic groupValue;
  final Function function;
  final String title;
  final String subTitle;
  final Function changeDeliveryAddressType;
  const ShippingOptionItem(
      {Key key,
      this.value,
      this.groupValue,
      this.function,
      @required this.title,
      @required this.subTitle,
      this.changeDeliveryAddressType})
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
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Color(0xff000000),
            ),
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(
              height: 1.6,
              fontSize: 14,
              color: Color(0xff000000),
            ),
          ),
          trailing: Radio(
            value: value,
            groupValue: groupValue,
            onChanged: (value) {
              changeDeliveryAddressType(value);
            },
          ),
        ),
        SizedBox(height: 12),
        Divider()
      ],
    );
  }
}
