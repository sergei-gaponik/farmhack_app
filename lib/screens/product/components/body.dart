import 'package:bauer_nebenan/models/CartProvider.dart';
import 'package:bauer_nebenan/models/Product.dart';
import 'package:flutter/material.dart';
import 'info.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../widgets/buttons.dart';

class ItemCount extends StatefulWidget {
  final Product product;
  ItemCount({this.product});
  @override
  _ItemCountState createState() => _ItemCountState(product: product);
}

class _ItemCountState extends State<ItemCount> {
  TextEditingController qtyController = TextEditingController();
  Product product;
  _ItemCountState({this.product});

  void initState() {
    _updateText(product.quantitySelected);
    super.initState();
  }

  void _update(int n) {
    product.quantitySelected = n;
  }

  void _updateText(int n) {
    qtyController.text = n.toString();
    _update(n);
  }

  void _increment() {
    _updateText(int.parse(qtyController.text) + 1);
  }

  void _decrement() {
    _updateText(int.parse(qtyController.text) - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: MaterialButton(
              onPressed: () => _decrement(),
              child: Icon(Icons.remove, size: 12),
              padding: EdgeInsets.all(12),
              shape: CircleBorder(),
            )),
        Expanded(
            flex: 2,
            child: SubmitButton(
              init: '${product.quantitySelected} Stück In den Warenkorb',
              success: '${product.quantitySelected} Stück hinzugefügt',
              onPressed: () =>
                  Provider.of<CartProvider>(context).cart.add(product),
            )),
        Expanded(
            flex: 1,
            child: MaterialButton(
              onPressed: () => _increment(),
              child: Icon(Icons.add, size: 12),
              padding: EdgeInsets.all(12),
              shape: CircleBorder(),
            )),
      ],
    );
  }
}

class Body extends StatefulWidget {
  final Product product;

  Body({this.product});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _disabled;

  @override
  void initState() {
    _disabled = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: FittedBox(
                child: Image.network(widget.product.images[0]),
                fit: BoxFit.cover),
          ),
          Expanded(
              flex: 3,
              child: ProductInfo(
                product: widget.product,
              )),
          Container(
              height: 100,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      height: 48,
                      margin: EdgeInsets.all(12),
                      child: SubmitButton(
                          init: 'In den Warenkorb',
                          success: 'Hinzugefügt',
                          onPressed: _disabled
                              ? null
                              : () async {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .cart
                                      .add(widget.product);
                                  setState(() {
                                    _disabled = true;
                                  });
                                  return true;
                                }),
                    )
                  ]))
        ],
      ));
}
