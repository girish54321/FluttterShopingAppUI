import 'package:FlutterShopingAppUI/screen/checkOutScreens/paymentButton.dart';
import 'package:FlutterShopingAppUI/screen/checkOutScreens/widget/checkOutContors.dart';
import 'package:FlutterShopingAppUI/screen/widgets/appInputText.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:rules/rules.dart';

class PaymentScreen extends StatelessWidget {
  final List<PaymnetButton> paymnetButtonList;
  final Function changePaymnetMethod;
  final Function goBack;
  final Function goToSummaryScreen;
  final int selectedPaymnetType;
  const PaymentScreen(
      {Key key,
      this.paymnetButtonList,
      this.changePaymnetMethod,
      this.selectedPaymnetType,
      this.goBack,
      this.goToSummaryScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 8,
            ),
            height: 60,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: paymnetButtonList.length,
              itemBuilder: (BuildContext context, int index) {
                PaymnetButton paymnetButton = paymnetButtonList[index];
                return Container(
                  margin: EdgeInsets.only(
                    left: 16,
                  ),
                  height: 60.00,
                  width: 105.00,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.00),
                  ),
                  child: RaisedButton(
                    color: selectedPaymnetType == index
                        ? Theme.of(context).accentColor
                        : Colors.white,
                    splashColor: Colors.white,
                    highlightColor: Theme.of(context).accentColor,
                    onPressed: () {
                      changePaymnetMethod(index);
                    },
                    child: Center(
                      child: Icon(
                        paymnetButton.iconData,
                        color: selectedPaymnetType != index
                            ? Colors.grey
                            : Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 14,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                new Text(
                  "Name on Card",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff000000).withOpacity(0.50),
                  ),
                ),
                InputText(
                  password: false,
                  hint: "Name on Card",
                  // textEditingController: street1TextEditingController,
                  validator: (street) {
                    final streetRule = Rule(
                      street,
                      name: 'Name on Card',
                      isRequired: true,
                    );
                    if (streetRule.hasError) {
                      return streetRule.error;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 14),
                new Text(
                  "Card Number",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff000000).withOpacity(0.50),
                  ),
                ),
                InputText(
                  password: false,
                  hint: "Card Number",
                  // textEditingController: street1TextEditingController,
                  validator: (street) {
                    final streetRule = Rule(
                      street,
                      name: 'Card Number',
                      isRequired: true,
                    );
                    if (streetRule.hasError) {
                      return streetRule.error;
                    } else {
                      return null;
                    }
                  },
                ),
                Container(
                  // margin: EdgeInsets.only(top: 18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Text(
                            "State",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff000000).withOpacity(0.50),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 140,
                            child: InputText(
                              password: false,
                              hint: "State",
                              // textEditingController: stateTextEditingController,
                              validator: (state) {
                                final stateRule = Rule(
                                  state,
                                  name: 'State',
                                  isRequired: true,
                                );
                                if (stateRule.hasError) {
                                  return stateRule.error;
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Text(
                            "Country",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff000000).withOpacity(0.50),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 140,
                            child: InputText(
                              password: false,
                              hint: "Country",
                              // textEditingController: countryTextEditingController,
                              validator: (country) {
                                final countryRule = Rule(
                                  country,
                                  name: 'Country',
                                  isRequired: true,
                                );
                                if (countryRule.hasError) {
                                  return countryRule.error;
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: CircularCheckBox(
                        value: true,
                        checkColor: Colors.white,
                        activeColor: Theme.of(context).accentColor,
                        inactiveColor: Colors.grey,
                        disabledColor: Colors.grey,
                        onChanged: (val) {
                          // changeSameAdress(val);
                        }),
                    title: Text("Save this card details"),
                    onTap: () {
                      print("SEE");
                      // changeSameAdress(!sameAddressselected);
                    }),
                CheckOutControls(changeIndex: () {
                  print("GOGOG");
                  goToSummaryScreen();
                }, goBack: () {
                  goBack(1);
                })
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
