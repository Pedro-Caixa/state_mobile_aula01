import 'package:flutter/material.dart';
import '../../models/product.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(name: 'Notebook', price: 3500),
    Product(name: 'Mouse', price: 120),
    Product(name: 'Teclado', price: 250),
    Product(name: 'Monitor', price: 900),
  ];

  List<Product> get products => _products;

  void toggleFavorite(int index) {
    _products[index].favorite = !_products[index].favorite;
    notifyListeners();
  }
}
