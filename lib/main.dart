import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'models/ProductsProvider.dart';
import 'models/LoadingProvider.dart';
import 'models/CartProvider.dart';
import 'route_generator.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CartProvider()),
      ChangeNotifierProvider(create: (context) => ProductsProvider()),
      ChangeNotifierProvider(create: (context) => LoadingProvider()),
    ], child: App()));

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bauer Nebenan',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: kTextColor,
                fontFamily: 'Montserrat',
                fontSizeFactor: 1.1,
              ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.light(
            primary: Colors.green[800],
          ),
          primaryColor: Colors.green[800],
          scaffoldBackgroundColor: Colors.grey[100],
          fontFamily: 'Montserrat',
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      );
}
