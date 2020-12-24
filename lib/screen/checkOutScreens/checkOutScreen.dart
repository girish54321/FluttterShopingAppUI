import 'package:FlutterShopingAppUI/helper/helper.dart';
import 'package:FlutterShopingAppUI/screen/checkOutScreens/paymentsOpstionScreen.dart';
import 'package:FlutterShopingAppUI/screen/checkOutScreens/views/checkOutAddress.dart';
import 'package:FlutterShopingAppUI/screen/checkOutScreens/widget/paymentButton.dart';
import 'package:FlutterShopingAppUI/screen/checkOutScreens/widget/shippingOptionView.dart';
import 'package:FlutterShopingAppUI/screen/checkOutScreens/widget/checkOutProgress.dart.dart';
import 'package:FlutterShopingAppUI/screen/checkOutScreens/widget/checkOutContors.dart';
import 'package:FlutterShopingAppUI/screen/sumaryScreen/summaryScreen.dart';
import 'package:FlutterShopingAppUI/screen/widgets/appToolbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class CheckOutScreen extends StatefulWidget {
  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  List<bool> isSelected = [true, false, false];
  PageController pageController;
  int selectedIndex = 0;
  int selectedDeliveryAddressType = 0;

  //For address view
  final street1TextEditingController = TextEditingController();
  final street2TextEditingController = TextEditingController();
  final cityTextEditingController = TextEditingController();
  final stateTextEditingController = TextEditingController();
  final countryTextEditingController = TextEditingController();
  //For paymnet view
  final nameOnCardTextEditingController = TextEditingController();
  final cardNumberTextEditingController = TextEditingController();
  final expDateTextEditingController = TextEditingController();
  final cvvTextEditingController = TextEditingController();
  //date
  DateTime selectedDate = DateTime.now();

  bool sameAddressselected = true;
  int selectedPaymnetType = 0;

  List<PaymnetButton> paymnetButtonList = [];

  Future<void> pickExpDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  changeExpDate(DateTime date) {
    print("HHHEH0");
    print(date);
    setState(() {
      selectedDate = date;
    });
  }

  changeIndex(index) {
    if (selectedDeliveryAddressType == 0) {
      Helper().showSnackBar(
          "Please Select Delivery", "Select Delivery", context, true);
    } else {
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        selectedIndex = index;
      });
    }
  }

  changeSameAdress(val) {
    setState(() {
      sameAddressselected = val;
    });
  }

  goBack(index) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      selectedIndex = index;
    });
  }

  changeIndexFormAddress(index) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      selectedIndex = index;
    });
  }

  changeDeliveryAddressType(value) {
    setState(() {
      selectedDeliveryAddressType = value;
    });
  }

  changePaymnetMethod(int index) {
    setState(() {
      selectedPaymnetType = index;
    });
  }

  goToSummaryScreen() {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft, child: SummaryScreen()));
  }

  @override
  void initState() {
    super.initState();
    PaymnetButton paymnetButton1 =
        new PaymnetButton(false, "paypal", FontAwesomeIcons.paypal);
    PaymnetButton paymnetButton2 =
        new PaymnetButton(true, "card", FontAwesomeIcons.creditCard);
    PaymnetButton paymnetButton3 =
        new PaymnetButton(false, "wallet ", FontAwesomeIcons.wallet);
    paymnetButtonList.add(paymnetButton1);
    paymnetButtonList.add(paymnetButton2);
    paymnetButtonList.add(paymnetButton3);
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    street1TextEditingController.dispose();
    street2TextEditingController.dispose();
    cityTextEditingController.dispose();
    stateTextEditingController.dispose();
    countryTextEditingController.dispose();

    nameOnCardTextEditingController.dispose();
    cardNumberTextEditingController.dispose();
    expDateTextEditingController.dispose();
    cvvTextEditingController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.selectedIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: header(context, "CheckOut"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CheckOutProgress(
                selectedIndex: selectedIndex,
              ),
              Container(
                height: size.height - 160,
                child: PageView(
                  children: <Widget>[
                    ShippingOptionView(
                      selectedDeliveryAddressType: selectedDeliveryAddressType,
                      changeDeliveryAddressType: changeDeliveryAddressType,
                    ),
                    CheckOutAddress(
                        sameAddressselected: sameAddressselected,
                        changeSameAdress: changeSameAdress,
                        street1TextEditingController:
                            street1TextEditingController,
                        street2TextEditingController:
                            street2TextEditingController,
                        cityTextEditingController: cityTextEditingController,
                        stateTextEditingController: stateTextEditingController,
                        countryTextEditingController:
                            countryTextEditingController,
                        changeIndexFormAddress: changeIndexFormAddress,
                        selectedIndex: selectedIndex,
                        goBack: goBack),
                    PaymentScreen(
                      selectedPaymnetType: selectedPaymnetType,
                      paymnetButtonList: paymnetButtonList,
                      goBack: goBack,
                      goToSummaryScreen: goToSummaryScreen,
                      changePaymnetMethod: changePaymnetMethod,
                      changeExpDate: pickExpDate,
                      expDate: selectedDate,
                      cardNumberTextEditingController:
                          cardNumberTextEditingController,
                      cvvTextEditingController: cvvTextEditingController,
                      nameOnCardTextEditingController:
                          nameOnCardTextEditingController,
                    ),
                  ],
                  controller: pageController,
                  onPageChanged: onPageChanged,
                  // physics: NeverScrollableScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: selectedIndex == 0
            ? CheckOutControls(
                goBack: () {
                  goBack(1);
                },
                changeIndex: () {
                  changeIndex(selectedIndex + 1);
                },
                selectedIndex: selectedIndex,
              )
            : Text(""));
  }
}
