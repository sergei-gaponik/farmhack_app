import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/Products.dart';
import '../../models/ProductsProvider.dart';
import '../error.dart';
import '../loading.dart';
import '../home/home_screen.dart';
import '../login/login_screen.dart';

class InitProductsScreen extends StatefulWidget {
  InitProductsState createState() => InitProductsState();
}

class InitProductsState extends State<InitProductsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(body: _initProducts());

  Widget _initProducts() => FutureBuilder<Products>(
      future:
          Provider.of<ProductsProvider>(context, listen: false).fetchProducts(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return LoadingScreen();
          case ConnectionState.active:
            return LoadingScreen();
          case ConnectionState.waiting:
            return LoadingScreen(
              title: 'Suche regionale Produkte...',
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              print(snapshot.error);
              return ErrorScreen(
                  message: snapshot.error.toString(),
                  body: ElevatedButton(
                    child: Text('Erneut versuchen'),
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                  ));
            } else {
              return HomeScreen();
            }
        }
        return LoadingScreen();
      });
}
