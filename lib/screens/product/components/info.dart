import 'package:bauer_nebenan/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProductInfo extends StatelessWidget {
  final Product product;
  ProductInfo({this.product});
  @override
  Widget build(BuildContext context) => Container(
        child: Padding(
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
                  child: Container(
                    height: 60,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60.0,
                            height: 60.0,
                            child: CircularPercentIndicator(
                              radius: 53.0,
                              lineWidth: 7,
                              percent: product.ecoRanking.toDouble() / 100.0,
                              progressColor: product.ecoRankingColor,
                              animation: true,
                              animationDuration: 1000,
                              curve: Curves.easeOut,
                              startAngle: 0.0,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '${product.ecoRanking} Eco Points',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      color: product.ecoRankingColor),
                                ),
                                Text(
                                  '${product.co2emitted.toString().replaceFirst('.', ',')}g CO2 Ausstoß',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      color: product.ecoRankingColor),
                                ),
                              ],
                            ),
                          )
                        ]),
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
                              backgroundImage:
                                  NetworkImage(product.farmerImage),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.farmerName,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '${product.distanceTravelled} km entfernt',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
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
        ),
      );
}
