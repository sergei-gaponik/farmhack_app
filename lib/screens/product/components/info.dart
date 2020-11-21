import 'package:bauer_nebenan/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProductInfo extends StatelessWidget {
  final Product product;
  ProductInfo({this.product});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                product.title,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                product.displayPrice,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ]),
            if (product.ecoRanking != null)
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: SizedBox(
                  height: 60,
                  child: Expanded(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 5.0,
                            percent: product.ecoRanking.toDouble() / 100.0,
                            progressColor: product.ecoRankingColor,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '${product.ecoRanking} Eco Points',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${product.co2emitted.toString().replaceFirst('.', ',')}g CO2 Ausstoß',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: SizedBox(
                height: 60,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(product.farmerImage),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.farmerName),
                          Text('${product.distanceTravelled} km entfernt'),
                        ],
                      )
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Text(
                'Produktbeschreibung',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                product.description,
              ),
            )
          ],
        ),
      );
}
