import 'package:FlutterShopingAppUI/helper/helper.dart';
import 'package:FlutterShopingAppUI/screen/checkOutScreens/widget/checkOutContors.dart';
import 'package:FlutterShopingAppUI/screen/checkOutScreens/widget/paymentButton.dart';
import 'package:FlutterShopingAppUI/screen/widgets/appInputText.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:rules/rules.dart';

class PaymentScreen extends StatelessWidget {
  final TextEditingController nameOnCardTextEditingController;
  final TextEditingController cardNumberTextEditingController;
  final TextEditingController cvvTextEditingController;
  final List<PaymnetButton> paymnetButtonList;
  final Function changePaymnetMethod;
  final Function goBack;
  final Function goToSummaryScreen;
  final int selectedPaymnetType;
  final DateTime expDate;
  final Function changeExpDate;
  const PaymentScreen(
      {Key key,
      @required this.paymnetButtonList,
      @required this.changePaymnetMethod,
      @required this.selectedPaymnetType,
      @required this.goBack,
      @required this.goToSummaryScreen,
      @required this.expDate,
      @required this.changeExpDate,
      @required this.nameOnCardTextEditingController,
      @required this.cardNumberTextEditingController,
      @required this.cvvTextEditingController})
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
              top: 18,
            ),
            height: 60,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...paymnetButtonList.asMap().entries.map((MapEntry map) {
                    int index = map.key;
                    PaymnetButton paymnetButton = paymnetButtonList[map.key];
                    return PaymentOptionItem(
                      changePaymnetMethod: changePaymnetMethod,
                      iconData: paymnetButton.iconData,
                      index: index,
                      selectedPaymnetType: selectedPaymnetType,
                    );
                  }).toList(),
                ]),
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
                Text(
                  "Name on Card",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff000000).withOpacity(0.50),
                  ),
                ),
                InputText(
                  password: false,
                  hint: "Name on Card",
                  textEditingController: nameOnCardTextEditingController,
                ),
                SizedBox(height: 14),
                Text(
                  "Card Number",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff000000).withOpacity(0.50),
                  ),
                ),
                InputText(
                  maxInput: 16,
                  password: false,
                  hint: "Card Number",
                  textEditingController: cardNumberTextEditingController,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Expiry Date",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff000000).withOpacity(0.50),
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 140,
                                child: Row(
                                  children: [
                                    Text(
                                      "${expDate.toLocal()}".split(' ')[0],
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(EvaIcons.calendar,
                                            size: 32,
                                            color:
                                                Theme.of(context).accentColor),
                                        onPressed: () async {
                                          await changeExpDate(context);
                                        })
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CVV",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff000000).withOpacity(0.50),
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 140,
                                child: InputText(
                                  maxInput: 3,
                                  password: false,
                                  hint: "CVV",
                                  textEditingController:
                                      cvvTextEditingController,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
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
                    onTap: () {}),
                CheckOutControls(changeIndex: () {
                  final nameOnCardRule = Rule(
                    nameOnCardTextEditingController.text,
                    name: 'Name on Card',
                    isRequired: true,
                  );
                  final cardNumberrRule = Rule(
                    cardNumberTextEditingController.text,
                    name: 'Card Number',
                    isRequired: true,
                  );
                  final cvvRule = Rule(
                    cvvTextEditingController.text,
                    name: 'CVV',
                    isRequired: true,
                  );
                  if (nameOnCardRule.hasError ||
                      cardNumberrRule.hasError ||
                      cvvRule.hasError) {
                    String errorMessage = nameOnCardRule.error +
                        "\n" +
                        cardNumberrRule.error +
                        "\n" +
                        cvvRule.error;
                    Helper().vibratPhone();
                    Helper().showSnackBar(errorMessage,
                        "Please check all the inputs", context, true);
                  } else {
                    goToSummaryScreen();
                  }
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

class PaymentOptionItem extends StatelessWidget {
  final Function changePaymnetMethod;
  final int selectedPaymnetType;
  final int index;
  final IconData iconData;
  const PaymentOptionItem(
      {Key key,
      @required this.changePaymnetMethod,
      @required this.selectedPaymnetType,
      @required this.index,
      @required this.iconData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
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
            iconData,
            // paymnetButton.iconData,
            color: selectedPaymnetType != index ? Colors.grey : Colors.white,
          ),
        ),
      ),
    );
  }
}
