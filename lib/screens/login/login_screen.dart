import 'package:flutter/material.dart';
import 'components/body.dart';

class LoginScreen extends StatefulWidget {
  @override
  createState() => LoginState();
}

class LoginState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
