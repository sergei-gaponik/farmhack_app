import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';
import '../app_bar.dart';
import '../../models/CartProvider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      appBar: TopBar().build(context),
    );
  }
}
