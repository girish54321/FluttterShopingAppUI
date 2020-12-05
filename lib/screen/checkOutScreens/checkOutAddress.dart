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
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  title:
                      Text("Billing address is the same as delivery address"),
                  onTap: () {
                    print("SEE");
                    changeSameAdress(!sameAddressselected);
                  }),
              SizedBox(height: 14),
              new Text(
                "Street 1",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff000000).withOpacity(0.50),
                ),
              ),
              InputText(
                password: false,
                hint: "Street 1",
                textEditingController: street1TextEditingController,
                validator: (street) {
                  final streetRule = Rule(
                    street,
                    name: 'Street 1',
                    isRequired: true,
                  );
                  if (streetRule.hasError) {
                    return streetRule.error;
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 18),
              new Text(
                "Street 2",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff000000).withOpacity(0.50),
                ),
              ),
              InputText(
                password: false,
                hint: "Street 2",
                textEditingController: street2TextEditingController,
                validator: (street) {
                  final streetRule = Rule(
                    street,
                    name: "Street 2",
                    isRequired: true,
                  );
                  if (streetRule.hasError) {
                    return streetRule.error;
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 18),
              new Text(
                "City",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff000000).withOpacity(0.50),
                ),
              ),
              InputText(
                password: false,
                hint: "City",
                textEditingController: cityTextEditingController,
                validator: (city) {
                  final cityRule = Rule(
                    city,
                    name: 'City',
                    isRequired: true,
                  );
                  if (cityRule.hasError) {
                    return cityRule.error;
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
                            textEditingController: stateTextEditingController,
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
                            textEditingController: countryTextEditingController,
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
              CheckOutControls(
                  changeIndex: () {
                    if (_formKey.currentState.validate()) {
                      changeIndexFormAddress(2);
                    } else {
                      print("NO------------");
                    }
                  },
                  selectedIndex: selectedIndex,
                  goBack: () {
                    goBack(0);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
