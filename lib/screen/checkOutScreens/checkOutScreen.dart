import 'package:FlutterShopingAppUI/helper/helper.dart';
import 'package:FlutterShopingAppUI/screen/checkOutScreens/checkOutAddress.dart';
import 'package:FlutterShopingAppUI/screen/checkOutScreens/paymentButton.dart';
import 'package:FlutterShopingAppUI/screen/checkOutScreens/paymentsOpstionScreen.dart';
import 'package:FlutterShopingAppUI/screen/checkOutScreens/widget/ShipingOpstionItem.dart';
import 'package:FlutterShopingAppUI/screen/checkOutScreens/widget/checkOutContors.dart';
import 'package:FlutterShopingAppUI/screen/sumaryScreen/summaryScreen.dart';
import 'package:FlutterShopingAppUI/screen/widgets/appToolbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:steps_indicator/steps_indicator.dart';

class CheckOutScreen extends StatefulWidget {
  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

// enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class _CheckOutScreenState extends State<CheckOutScreen> {
  List<bool> isSelected = [true, false, false];
  PageController pageController;
  int selectedIndex = 0;
  int selectedDeliveryAddressType = 0;
  final street1TextEditingController = TextEditingController();
  final street2TextEditingController = TextEditingController();
  final cityTextEditingController = TextEditingController();
  final stateTextEditingController = TextEditingController();
  final countryTextEditingController = TextEditingController();

  bool sameAddressselected = true;
  int selectedPaymnetType = 0;

  List<PaymnetButton> paymnetButtonList = [];

  changeIndex(index) {
    if (selectedDeliveryAddressType == 0) {
      Helper().showSnackBar(
          "Plz Select Delivery", "Select Delivery", context, true);
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
    print("GO BACK");
    print(index);
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
    print("changeIndexFormAddress");
    print(index);
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

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
        appBar: header(context, "CheckOut"),
        body: SingleChildScrollView(
          // controller: controller,
          child: Column(
            children: [
              Container(
                // color: Colors.red,
                height: 76,
                child: Column(
                  children: [
                    StepsIndicator(
                      selectedStep: selectedIndex + 1,
                      nbSteps: 3,
                      selectedStepColorOut: Theme.of(context).accentColor,
                      selectedStepColorIn: Colors.white,
                      doneStepColor: Colors.blue,
                      unselectedStepColorOut: Colors.grey,
                      doneLineColor: Theme.of(context).accentColor,
                      undoneLineColor: Colors.grey,
                      isHorizontal: true,
                      lineLength: 110,
                      doneLineThickness: 2,
                      undoneLineThickness: 2,
                      doneStepSize: 10,
                      // unselectedStepSize: 10,
                      // selectedStepSize: 14,
                      // selectedStepBorderSize: 1,
                      doneStepWidget: Container(
                        // margin: EdgeInsets.only(top: 20),
                        height: 30.00,
                        width: 30.00,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          border: Border.all(
                            width: 1.00,
                            color: Color(0xffdddddd),
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          margin: EdgeInsets.all(6),
                          height: 16.00,
                          width: 16.00,
                          decoration: BoxDecoration(
                            color: Color(0xff00c569),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      unselectedStepWidget: Container(
                        height: 30.00,
                        width: 30.00,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          border: Border.all(
                            width: 1.00,
                            color: Color(0xffdddddd),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ), // Custom Widget
                      selectedStepWidget: Container(
                        height: 30.00,
                        width: 30.00,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          border: Border.all(
                            width: 1.00,
                            color: Color(0xffdddddd),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ), // Custom Widget
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 11),
                      width: 330,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Deliverys",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Text(
                            "Address",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff000000),
                            ),
                          ),
                          Text(
                            "Payments",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff000000),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height - 160,
                child: PageView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: <Widget>[
                          ShipingOpstionItem(
                              title: "Standard Delivery",
                              subTitle:
                                  "Order will be delivered between 3 - 5 business days",
                              groupValue: selectedDeliveryAddressType,
                              changeDeliveryAddressType:
                                  changeDeliveryAddressType,
                              value: 1),
                          ShipingOpstionItem(
                              title: "Next Day Delivery",
                              subTitle:
                                  "Place your order before 6pm and your items will be delivered the next day",
                              groupValue: selectedDeliveryAddressType,
                              changeDeliveryAddressType:
                                  changeDeliveryAddressType,
                              value: 2),
                          ShipingOpstionItem(
                              title: "Nominated Delivery",
                              subTitle:
                                  "Pick a particular date from the calendar and order will be delivered on selected date",
                              groupValue: selectedDeliveryAddressType,
                              changeDeliveryAddressType:
                                  changeDeliveryAddressType,
                              value: 3),
                          SizedBox(
                            height: 70,
                          )
                        ],
                      ),
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
                        changePaymnetMethod: changePaymnetMethod),
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
