import 'package:bauer_nebenan/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/CartProvider.dart';
import '../../../models/Products.dart';
import '../../../constants.dart';
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
        Container(
          height: 36,
          child: Center(
            child: Text(
              'Dein Warenkorb',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
        ),
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
          height: 96,
          margin: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IntrinsicWidth(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    child: Text('Jetzt bestellen'),
                    onPressed: () async {
                      var res = await submit();
                      print(res);
                      Navigator.of(context)
                          .pushNamed('/checkout', arguments: res);
                    },
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
