import 'package:bauer_nebenan/models/Product.dart';
import 'package:bauer_nebenan/screens/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'components/body.dart';

class ProductScreen extends StatelessWidget {
  static Route<dynamic> route(Product product) {
    return MaterialPageRoute(builder: (BuildContext context) {
      return ProductScreen(product: product);
    });
  }

  final Product product;

  const ProductScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar().build(context),
      body: Body(product: this.product),
    );
  }
}
