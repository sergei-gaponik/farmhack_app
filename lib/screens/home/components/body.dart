import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../models/Product.dart';
import '../../../models/Products.dart';
import '../../../models/ProductsProvider.dart';
import '../../product/product_screen.dart';

import 'categories.dart';
import 'item_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Products products;

  @override
  void initState() {
    products = Provider.of<ProductsProvider>(context, listen: false).products;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> productList = products.all;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: 12),
          child: Text(
            "Nachhaltige Produkte aus deiner Region",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        //Categories(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: 12),
          child: GridView.builder(
              itemCount: productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPadding,
                crossAxisSpacing: kDefaultPadding,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(
                    product: productList[index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(
                            product: productList[index],
                          ),
                        )),
                  )),
        )),
      ],
    );
  }
}
