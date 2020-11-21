import 'package:bauer_nebenan/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class TopBar extends StatelessWidget {
  void back(BuildContext context) {
    Navigator.maybePop(context);
  }

  void cart(BuildContext context) {
    Navigator.pushNamed(context, '/cart');
  }

  @override
  Widget build(BuildContext context) => AppBar(
        elevation: 0,
        backgroundColor: Color(0x00EFEFFE),
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg",
              color: Colors.green[800]),
          onPressed: () => back(context),
        ),
        actions: <Widget>[
          IconButton(
              icon: SvgPicture.asset(
                "assets/icons/cart.svg",
                color: Colors.green[800],
              ),
              onPressed: () => Navigator.pushNamed(context, '/cart')),
          SizedBox(width: kDefaultPadding / 2)
        ],
      );
}
