import 'package:flutter/material.dart';

import 'screens/login/login_screen.dart';
import 'screens/register/register_screen.dart';
import 'screens/init/init_screen.dart';
import 'screens/error.dart';
import 'screens/product/product_screen.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/checkout/checkout_screen.dart';
import 'models/Product.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/product':
        if (args is Product)
          return MaterialPageRoute(
              builder: (_) => ProductScreen(product: args));
        else
          return _errorRoute();
        break;
      case '/cart':
        return MaterialPageRoute(builder: (_) => CartScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case '/init':
        return MaterialPageRoute(builder: (_) => InitScreen());
      case '/checkout':
        return MaterialPageRoute(
            builder: (_) => CheckoutScreen(checkoutResponse: args));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) => ErrorScreen());
  }
}
