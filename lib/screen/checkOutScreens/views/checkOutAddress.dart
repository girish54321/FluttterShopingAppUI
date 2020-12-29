import 'package:FlutterShopingAppUI/helper/helper.dart';
import 'package:FlutterShopingAppUI/screen/checkOutScreens/widget/checkOutContors.dart';
import 'package:FlutterShopingAppUI/screen/widgets/appInputText.dart';
import 'package:flutter/material.dart';
import 'package:rules/rules.dart';
import 'package:circular_check_box/circular_check_box.dart';

class CheckOutAddress extends StatelessWidget {
  final Function changeIndexFormAddress;
  final Function goBack;
  final int selectedIndex;
  final bool sameAddressselected;
  final Function changeSameAdress;
  final TextEditingController street1TextEditingController;
  final TextEditingController street2TextEditingController;
  final TextEditingController cityTextEditingController;
  final TextEditingController stateTextEditingController;
  final TextEditingController countryTextEditingController;
  const CheckOutAddress(
      {Key key,
      this.changeIndexFormAddress,
      this.selectedIndex,
      this.street1TextEditingController,
      this.street2TextEditingController,
      this.cityTextEditingController,
      this.stateTextEditingController,
      this.countryTextEditingController,
      this.goBack,
      this.sameAddressselected,
      this.changeSameAdress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 14,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: CircularCheckBox(
                    value: sameAddressselected,
                    checkColor: Colors.white,
                    activeColor: Theme.of(context).accentColor,
                    inactiveColor: Colors.grey,
                    disabledColor: Colors.grey,
                    onChanged: (val) {
                      changeSameAdress(val);
                    }),
                title: Text("Billing address is the same as delivery address"),
                onTap: () {
                  changeSameAdress(!sameAddressselected);
                }),
            SizedBox(height: 14),
            Text(
              "Street 1",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            InputText(
              password: false,
              hint: "Street 1",
              textEditingController: street1TextEditingController,
            ),
            SizedBox(height: 18),
            new Text(
              "Street 2",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            InputText(
              password: false,
              hint: "Street 2",
              textEditingController: street2TextEditingController,
            ),
            SizedBox(height: 18),
            new Text(
              "City",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            InputText(
              password: false,
              hint: "City",
              textEditingController: cityTextEditingController,
            ),
            Container(
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
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 140,
                        child: InputText(
                          password: false,
                          hint: "State",
                          textEditingController: stateTextEditingController,
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
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 140,
                        child: InputText(
                          password: false,
                          hint: "Country",
                          textEditingController: countryTextEditingController,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            CheckOutControls(
                changeIndex: () {
                  final streetRule = Rule(
                    street1TextEditingController.text,
                    name: 'Street 1',
                    isRequired: true,
                  );
                  final streetRule2 = Rule(
                    street2TextEditingController.text,
                    name: "Street 2",
                    isRequired: true,
                  );
                  final cityRule = Rule(
                    cityTextEditingController.text,
                    name: 'City',
                    isRequired: true,
                  );
                  final stateRule = Rule(
                    stateTextEditingController.text,
                    name: 'State',
                    isRequired: true,
                  );
                  final countryRule = Rule(
                    countryTextEditingController.text,
                    name: 'Country',
                    isRequired: true,
                  );
                  if (streetRule.hasError ||
                      streetRule2.hasError ||
                      cityRule.hasError ||
                      stateRule.hasError ||
                      countryRule.hasError) {
                    String errorMessage = streetRule.error +
                        "\n" +
                        streetRule2.error +
                        "\n" +
                        cityRule.error +
                        "\n" +
                        stateRule.error +
                        "\n" +
                        countryRule.error;
                    //         res.data.error_msg.forEach((item) => {
                    //   message = message + "\n" + item;
                    // });
                    Helper().vibratPhone();
                    Helper().showSnackBar(errorMessage,
                        "Please check all the inputs", context, true);
                  } else {
                    changeIndexFormAddress(2);
                  }
                },
                selectedIndex: selectedIndex,
                goBack: () {
                  goBack(0);
                }),
          ],
        ),
      ),
    );
  }
}
