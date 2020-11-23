import 'package:flutter/material.dart';

class Product {
  final String id, title, description, unit, farmerImage, farmerName;
  int quantitySelected;
  final num quantityAvailable, price, distanceTravelled, ecoRanking, co2emitted;
  final List images;

  Product({
    this.id,
    this.title,
    this.description,
    this.unit,
    this.quantityAvailable,
    this.quantitySelected = 1,
    this.price,
    this.distanceTravelled,
    this.ecoRanking,
    this.co2emitted,
    this.images,
    this.farmerImage,
    this.farmerName,
  });

  Color get ecoRankingColor {
    if (this.ecoRanking > 70)
      return Colors.green;
    else if (this.ecoRanking > 40)
      return Colors.orange;
    else
      return Colors.red;
  }

  _formatPrice(num n) => n.toString().replaceFirst('.', ',');

  num get total => this.quantitySelected * this.price;

  String get displayPrice => '${_formatPrice(this.price)} € / ${this.unit}';

  String get priceAndQuantity =>
      '${this.quantitySelected} x ${_formatPrice(this.price)} €';

  factory Product.fromJSON(Map<String, dynamic> json) => Product(
        id: json['id'] ?? null,
        title: json['title'] ?? null,
        description: json['description'] ?? '',
        unit: json['unit'] ?? 'kg',
        quantityAvailable: json['quantity'] ?? null,
        price: json['price'] ?? null,
        distanceTravelled: json['ecoScore']['distance'] ?? null,
        ecoRanking: json['ecoScore']['ranking'] ?? null,
        co2emitted: json['ecoScore']['co2'] ?? null,
        images: json['images'] ?? [],
        farmerImage: json['farmerDetails']['imageURL'] ?? null,
        farmerName: json['farmerDetails']['name'] ?? null,
      );
}
