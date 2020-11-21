import 'package:bauer_nebenan/models/Product.dart';
import 'package:bauer_nebenan/models/ProductsProvider.dart';
import 'package:bauer_nebenan/screens/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'components/body.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  ProductScreen({this.product});
  @override
  createState() => _ProductState();
}

class _ProductState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar().build(context),
      body: Body(product: widget.product),
    );
  }
}
