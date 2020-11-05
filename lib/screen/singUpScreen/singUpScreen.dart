import 'package:FlutterShopingAppUI/screen/singUpScreen/signUpUi.dart';
import 'package:flutter/material.dart';

class SingUpScreen extends StatefulWidget {
  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingUpUi(
      passwordController: passwordController,
      userNameController: userNameController,
      emailController: emailController,
    );
  }
}
