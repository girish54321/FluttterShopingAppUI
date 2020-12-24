import 'package:FlutterShopingAppUI/screen/checkOutScreens/widget/shippingOptionItem.dart';
import 'package:flutter/material.dart';

class ShippingOptionView extends StatelessWidget {
  final int selectedDeliveryAddressType;
  final Function changeDeliveryAddressType;

  const ShippingOptionView(
      {Key key,
      @required this.selectedDeliveryAddressType,
      @required this.changeDeliveryAddressType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          ShippingOptionItem(
              title: "Standard Delivery",
              subTitle: "Order will be delivered between 3 - 5 business days",
              groupValue: selectedDeliveryAddressType,
              changeDeliveryAddressType: changeDeliveryAddressType,
              value: 1),
          ShippingOptionItem(
              title: "Next Day Delivery",
              subTitle:
                  "Place your order before 6pm and your items will be delivered the next day",
              groupValue: selectedDeliveryAddressType,
              changeDeliveryAddressType: changeDeliveryAddressType,
              value: 2),
          ShippingOptionItem(
              title: "Nominated Delivery",
              subTitle:
                  "Pick a particular date from the calendar and order will be delivered on selected date",
              groupValue: selectedDeliveryAddressType,
              changeDeliveryAddressType: changeDeliveryAddressType,
              value: 3),
          SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}
