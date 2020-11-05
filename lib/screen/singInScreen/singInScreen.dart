import 'package:FlutterShopingAppUI/screen/singInScreen/signInUi.dart';
import 'package:flutter/material.dart';

class SingInScreen extends StatefulWidget {
  SingInScreen({Key key}) : super(key: key);

  @override
  _SingInScreenState createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SignInUi(
      emailController: emailController,
      passwordController: passwordController,
    );
  }
}
