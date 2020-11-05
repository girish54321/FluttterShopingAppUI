import 'package:FlutterShopingAppUI/screen/checkOutScreens/chcekOutScree.dart';
import 'package:FlutterShopingAppUI/screen/widgets/chekOutAddtoCart.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Modal {
  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  _createTile(context, 'Sub Total', "2000", _action3),
                  Divider(),
                  _createTile(context, 'Tex', "100", _action3),
                  Divider(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: TextField(
                      decoration: new InputDecoration(
                        suffixIcon: FlatButton(
                          onPressed: () {},
                          child: Text(
                            "APPLY",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "SF Pro Text",
                              fontSize: 14,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        hintText: 'Enter Voucher Code',
                      ),
                    ),
                  ),
                  CheckOutAddToCartView(
                    buttonText: "CHECKOUT",
                    function: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: CheckOutScreen()));
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  ListTile _createTile(
      BuildContext context, String title, String prise, Function action) {
    return ListTile(
      leading: new Text(
        title,
        style: TextStyle(
          fontFamily: "SF Pro Display",
          fontSize: 16,
          color: Color(0xff000000),
        ),
      ),
      // title: Text(name),
      trailing: new Text(
        prise,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontFamily: "SF Pro Display",
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Color(0xff000000),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        action();
      },
    );
  }

  _action1() {
    print('action 1');
  }

  _action2() {
    print('action 2');
  }

  _action3() {
    print('action 3');
  }
}

class TotalaAmountView extends StatefulWidget {
  @override
  _TotalaAmountViewState createState() => _TotalaAmountViewState();
}

class _TotalaAmountViewState extends State<TotalaAmountView> {
  ListTile _createTile(
      BuildContext context, String title, String prise, Function action) {
    return ListTile(
      leading: new Text(
        title,
        style: TextStyle(
          fontFamily: "SF Pro Display",
          fontSize: 16,
          color: Color(0xff000000),
        ),
      ),
      // title: Text(name),
      trailing: new Text(
        prise,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontFamily: "SF Pro Display",
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Color(0xff000000),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        action();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          _createTile(context, 'Sub Total', "2000", () {
            print('action 3');
          }),
          Divider(),
          _createTile(context, 'Tex', "100", () {
            print('action 3');
          }),
          Divider(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              decoration: new InputDecoration(
                suffixIcon: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "APPLY",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "SF Pro Text",
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                hintText: 'Enter Voucher Code',
              ),
            ),
          ),
          CheckOutAddToCartView(
            buttonText: "CHECKOUT",
            function: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: CheckOutScreen()));
            },
          ),
        ],
      ),
    );
  }
}
