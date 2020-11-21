import 'package:bauer_nebenan/screens/init/init_screen.dart';
import 'package:bauer_nebenan/screens/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'screens/init/init_screen.dart';
import 'screens/login/login_screen.dart';
import 'models/ProductsProvider.dart';
import 'models/CartProvider.dart';
import 'screens/cart/cart_screen.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CartProvider()),
      ChangeNotifierProvider(create: (context) => ProductsProvider()),
    ], child: App()));

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bauer Nebenan',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.light(
            primary: Colors.green[800],
          ),
          primaryColor: Colors.green[800],
        ),
        home: InitProductsScreen(),
        routes: {
          '/home': (context) => InitProductsScreen(),
          '/login': (context) => LoginScreen(),
          '/cart': (context) => CartScreen(),
          '/product': (context) => ProductScreen(),
        },
      );
}
