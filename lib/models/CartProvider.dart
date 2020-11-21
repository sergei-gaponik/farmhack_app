import 'package:bauer_nebenan/util/fetch.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import './Product.dart';

class CartProvider extends ChangeNotifier {
  List<Product> cart = [];

  void clear() {
    cart = [];
    notifyListeners();
  }

  void add(Product product) {
    cart.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    int index = cart.indexWhere((p) => p.id == product.id);
    cart.removeAt(index);
    notifyListeners();
  }

  Future submit() async {
    Map body = {
      'paymentMethod': 'bar',
      'items': cart.map((p) => ({"id": p.id, "quantity": 1}))
    };
    Map res = await Fetcher.fetch('post', 'api/order', body: body);
    print(res);
  }
}
