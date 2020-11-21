import 'Product.dart';

class Products {
  final List<Product> all;

  Products({this.all});

  factory Products.fromList(List<dynamic> jsonList) => Products(
      all: jsonList.map((dynamic json) => Product.fromJSON(json)).toList());
}
