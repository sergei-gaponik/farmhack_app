import 'package:bauer_nebenan/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final Product product;
  CartItem({this.product});
  @override
  Widget build(BuildContext context) => Container(
      height: 100,
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.network(
              product.images[0],
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(child: Text(product.title))),
          ),
          Container(
            width: 80,
            height: 80,
            child: Center(
              child: Text(product.priceAndQuantity),
            ),
          )
        ],
      ));
}
