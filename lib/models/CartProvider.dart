import 'package:bauer_nebenan/util/fetch.dart';
import 'package:flutter/foundation.dart';

import './Product.dart';

class CartProvider extends ChangeNotifier {
  List<Product> cart = [];

  void clear() {
    cart = [];
    notifyListeners();
  }

  void add(Product product) {
    var index = cart.indexWhere((p) => p.id == product.id);
    if (index >= 0) {
      cart[index].quantitySelected += 1;
    } else {
      cart.add(product);
    }
    print(cart);

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
      'items': cart
          .map((p) => ({"id": p.id, "quantity": p.quantitySelected}))
          .toList()
    };
    Map res = await Fetcher.fetch('post', 'api/order', body: body);
    clear();
    print('res: $res');
    return res;
  }
}
