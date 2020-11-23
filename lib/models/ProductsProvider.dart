import 'package:bauer_nebenan/util/fetch.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../util/fetch.dart';
import './Products.dart';
import './Product.dart';

class ProductsProvider extends ChangeNotifier {
  Products products;
  Product current;

  void setCurrent(Product p) {
    current = p;
    notifyListeners();
  }

  Future<Products> fetchProducts() async {
    Map json = await Fetcher.fetch('get', 'api/products');
    List<dynamic> productsJSON = json['products'];
    if (productsJSON.isEmpty) throw ('Keine Produkte gefunden');
    products = Products.fromList(productsJSON);
    notifyListeners();
    return Future.delayed(Duration(milliseconds: 3500));
  }
}
