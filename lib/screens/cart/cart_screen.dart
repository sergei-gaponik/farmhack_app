import 'package:flutter/material.dart';

import 'components/body.dart';
import '../app_bar.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      appBar: TopBar().build(context),
    );
  }
}
