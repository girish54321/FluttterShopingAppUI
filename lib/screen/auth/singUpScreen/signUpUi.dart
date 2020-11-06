import 'package:FlutterShopingAppUI/helper/helper.dart';
import 'package:FlutterShopingAppUI/provider/loginState.dart';
import 'package:FlutterShopingAppUI/screen/auth/otpScreen/otpScreen.dart';
import 'package:FlutterShopingAppUI/screen/widgets/appInputText.dart';
import 'package:FlutterShopingAppUI/screen/widgets/appToolbar.dart';
import 'package:FlutterShopingAppUI/screen/widgets/appbutton.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rules/rules.dart';

class SingUpUi extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController userNameController;
  final Function userCreateAccount;

  const SingUpUi(
      {Key key,
      this.emailController,
      this.passwordController,
      this.userNameController,
      this.userCreateAccount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(18.0),
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      height: 522.00,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sign Up,",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                          new Text(
                            "Sign in to Continue",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff929292),
                            ),
                          ),
                          SizedBox(height: 22),
                          new Text(
                            "User Name",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff000000).withOpacity(0.50),
                            ),
                          ),
                          InputText(
                              password: false,
                              hint: "User Name",
                              textEditingController: userNameController,
                              validator: (userName) {
                                final userNameRule = Rule(
                                  userName,
                                  name: 'User Name',
                                  isRequired: true,
                                );
                                if (userNameRule.hasError) {
                                  return userNameRule.error;
                                } else {
                                  return null;
                                }
                              }),
                          Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff000000).withOpacity(0.50),
                            ),
                          ),
                          InputText(
                              password: false,
                              hint: "Email",
                              textEditingController: emailController,
                              validator: (email) {
                                final emailRule = Rule(email,
                                    name: 'Email',
                                    isRequired: true,
                                    isEmail: true);
                                if (emailRule.hasError) {
                                  return emailRule.error;
                                } else {
                                  return null;
                                }
                              }),
                          Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff000000).withOpacity(0.50),
                            ),
                          ),
                          InputText(
                              textEditingController: passwordController,
                              password: true,
                              hint: "Password",
                              validator: (password) {
                                final passWordRule = Rule(password,
                                    name: 'Password',
                                    isRequired: true,
                                    minLength: 6);
                                if (passWordRule.hasError) {
                                  return passWordRule.error;
                                } else {
                                  return null;
                                }
                              }),
                          SizedBox(
                            height: 33,
                          ),
                          Consumer<LoginStateProvider>(
                            builder: (context, loginStateProvider, child) {
                              return AppButton(
                                buttonText: "SIGN UP",
                                function: () {
                                  if (_formKey.currentState.validate()) {
                                    userCreateAccount(
                                        loginStateProvider.changeLoginState);
                                  } else {
                                    Helper().vibratPhone();
                                  }
                                },
                              );
                            },
                          ),
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
