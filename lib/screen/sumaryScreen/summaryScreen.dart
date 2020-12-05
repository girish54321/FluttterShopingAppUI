import 'package:FlutterShopingAppUI/screen/checkOutScreens/widget/checkOutContors.dart';
import 'package:FlutterShopingAppUI/screen/sumaryScreen/cartList.dart';
import 'package:FlutterShopingAppUI/screen/widgets/appToolbar.dart';
import 'package:FlutterShopingAppUI/screen/widgets/sussesssScreen.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class SummaryScreen extends StatefulWidget {
  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context, "Summary"),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 18),
              Container(
                  height: 170,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return CartListItem();
                    },
                  )),
              SizedBox(height: 17),
              Divider(),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 14, vertical: 1),
                title: Text(
                  "Shipping Address",
                  style: TextStyle(
                    height: 1.6,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color(0xff000000),
                  ),
                ),
                subtitle: Text(
                  "21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria",
                  style: TextStyle(
                    height: 1.6,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
                trailing: CircularCheckBox(
                    value: true,
                    checkColor: Colors.white,
                    activeColor: Theme.of(context).accentColor,
                    inactiveColor: Colors.grey,
                    disabledColor: Colors.grey,
                    onChanged: (val) {
                      // changeSameAdress(val);
                    }),
              ),
              Divider(),
              SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 1),
                child: Text(
                  "Payment",
                  style: TextStyle(
                    height: 1.6,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 14, vertical: 1),
                title: Text(
                  "Master Card",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff929292),
                  ),
                ),
                subtitle: Text(
                  "****  ****  ****  4543",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                ),
                leading: Icon(
                  FontAwesomeIcons.ccMastercard,
                  color: Colors.orange,
                ),
                trailing: CircularCheckBox(
                    value: true,
                    checkColor: Colors.white,
                    activeColor: Theme.of(context).accentColor,
                    inactiveColor: Colors.grey,
                    disabledColor: Colors.grey,
                    onChanged: (val) {
                      // changeSameAdress(val);
                    }),
              ),
              SizedBox(height: 12),
              CheckOutControls(
                  buttonText: "PAY",
                  changeIndex: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: SuccessScreen()));
                  },
                  goBack: () {}),
              SizedBox(height: 12),
            ],
          ),
        ));
  }
}
