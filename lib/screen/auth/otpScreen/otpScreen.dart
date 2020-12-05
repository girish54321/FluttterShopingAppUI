import 'package:FlutterShopingAppUI/screen/homeScreen/homemain.dart';
import 'package:FlutterShopingAppUI/screen/widgets/appToolbar.dart';
import 'package:FlutterShopingAppUI/screen/widgets/appbutton.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  Widget onlySelectedBorderPinPut() {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: const Color.fromRGBO(235, 236, 237, 1),
      borderRadius: BorderRadius.circular(5.0),
    );
    return Form(
      // key: _formKey,
      child: GestureDetector(
        onLongPress: () {
          // print(_formKey.currentState.validate());
        },
        child: PinPut(
          validator: (s) {
            if (s.contains('1')) return null;
            return 'NOT VALID';
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          withCursor: true,
          fieldsCount: 5,
          fieldsAlignment: MainAxisAlignment.spaceAround,
          textStyle: const TextStyle(fontSize: 25.0, color: Colors.black),
          eachFieldMargin: EdgeInsets.all(0),
          eachFieldWidth: 51.0,
          eachFieldHeight: 51.0,
          // onSubmit: (String pin) => _showSnackBar(pin),
          focusNode: _pinPutFocusNode,
          controller: _pinPutController,
          submittedFieldDecoration: pinPutDecoration,
          selectedFieldDecoration: pinPutDecoration.copyWith(
            color: Colors.white,
            border: Border.all(
              width: 1,
              color: const Color.fromRGBO(160, 215, 220, 1),
            ),
          ),
          followingFieldDecoration: pinPutDecoration,
          pinAnimationType: PinAnimationType.scale,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, null),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 44.0),
                    Container(
                      padding: EdgeInsets.all(18.0),
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      height: 300.00,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.00, 5.00),
                            color: Color(0xff242424).withOpacity(0.05),
                            blurRadius: 15,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(4.00),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Text(
                            "Verification",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: Color(0xff000000),
                            ),
                          ),
                          const SizedBox(height: 11.0),
                          new Text(
                            "A 6 - Digit PIN has been sent to your email address, enter it below to continue",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff929292),
                            ),
                          ),
                          const SizedBox(height: 33.0),
                          Container(
                            color: Colors.white,
                            // margin: const EdgeInsets.all(12.0),
                            // padding: const EdgeInsets.all(12.0),
                            child: onlySelectedBorderPinPut(),
                          ),
                          const SizedBox(height: 30.0),
                          AppButton(
                            buttonText: "CONTINUE",
                            function: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomeMainScreen(),
                                ),
                                (route) => false,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
