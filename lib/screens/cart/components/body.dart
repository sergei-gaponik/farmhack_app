import 'package:bauer_nebenan/models/Product.dart';
import 'package:bauer_nebenan/models/ProductsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/CartProvider.dart';
import '../../../models/Products.dart';
import '../../../models/ProductsProvider.dart';
import '../../../constants.dart';
import '../../../widgets/buttons.dart';
import 'item.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Product> cart;
  Products products;

  @override
  void initState() {
    cart = Provider.of<CartProvider>(context, listen: false).cart;
    super.initState();
  }

  Future submit() => Provider.of<CartProvider>(context, listen: false).submit();

  @override
  Widget build(BuildContext context) {
    print(cart);
    return Column(
      children: [
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: 12),
              child: ListView(
                children: cart
                    .map((Product product) => CartItem(product: product))
                    .toList(),
              )),
        ),
        Container(
            height: 100,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 250,
                height: 48,
                margin: EdgeInsets.all(12),
                child: SubmitButton(
                  init: 'In den Warenkorb',
                  success: 'Hinzugefügt',
                  onPressed: submit,
                ),
              )
            ]))
      ],
    );
  }
}
