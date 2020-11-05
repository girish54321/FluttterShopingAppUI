import 'package:FlutterShopingAppUI/screen/trackOrderScreen/orderStatus.dart';
import 'package:FlutterShopingAppUI/screen/trackOrderScreen/trackOrderItem.dart';
import 'package:FlutterShopingAppUI/screen/widgets/appToolbar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class TrackOrder extends StatefulWidget {
  TrackOrder({Key key}) : super(key: key);

  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  goToTrackScreenView() {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft, child: OrderStatusView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context, "Track Order"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  "Sept 23, 2018",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff000000).withOpacity(0.60),
                  ),
                ),
              ),
              Container(
                child:
                    TrackOrderItem(done: false, function: goToTrackScreenView),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  "Sept 23, 2018",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff000000).withOpacity(0.60),
                  ),
                ),
              ),
              Container(
                child:
                    TrackOrderItem(done: true, function: goToTrackScreenView),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  "Sept 23, 2018",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff000000).withOpacity(0.60),
                  ),
                ),
              ),
              Container(
                child:
                    TrackOrderItem(done: true, function: goToTrackScreenView),
              ),
            ],
          ),
        ));
  }
}
