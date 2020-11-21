import 'package:bauer_nebenan/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

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
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Hero(
              tag: "${product.id}",
              child: Image.network(product.images[0]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Expanded(child: Text(product.title)),
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
