import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/Products.dart';
import '../../models/ProductsProvider.dart';
import '../../models/LoadingProvider.dart';
import '../loading/loading.dart';

import '../../screens/home/home_screen.dart';

class InitScreen extends StatefulWidget {
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  Future imageURL;
  Future products;

  @override
  void initState() {
    imageURL =
        Provider.of<LoadingProvider>(context, listen: false).getImageURL();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: FutureBuilder<String>(
          future: imageURL,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return LoadingScreen(logo: true);
              case ConnectionState.active:
                return LoadingScreen(logo: true);
              case ConnectionState.waiting:
                return LoadingScreen(logo: true);
              case ConnectionState.done:
                if (snapshot.hasError) {
                  print(snapshot.error);
                } else {
                  return InitProductsScreen(
                    imageURL: snapshot.data,
                  );
                }
            }
            return LoadingScreen(logo: true);
          }));
}

class InitProductsScreen extends StatefulWidget {
  final String imageURL;

  InitProductsScreen({this.imageURL});
  @override
  _InitProductsScreenState createState() => _InitProductsScreenState();
}

class _InitProductsScreenState extends State<InitProductsScreen> {
  Future products;

  @override
  void initState() {
    products =
        Provider.of<ProductsProvider>(context, listen: false).fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: FutureBuilder<Products>(
          future: products,
          builder: (context, snapshot) {
            print('moin');
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return LoadingScreen();
              case ConnectionState.active:
                return LoadingScreen();
              case ConnectionState.waiting:
                return LoadingScreen(
                    title: 'Suche regionale Produkte...',
                    loading: widget.imageURL);
              case ConnectionState.done:
                print('done');
                if (snapshot.hasError)
                  print(snapshot.error);
                else
                  return HomeScreen();
            }
            return LoadingScreen();
          }));
}
