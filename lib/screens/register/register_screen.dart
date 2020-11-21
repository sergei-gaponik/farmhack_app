import 'package:flutter/material.dart';
import 'components/body.dart';

class RegisterScreen extends StatefulWidget {
  @override
  createState() => RegisterState();
}

class RegisterState extends State<RegisterScreen> {
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
