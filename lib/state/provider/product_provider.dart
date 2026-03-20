import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/product.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    if (_isLoading) {
      return;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode != 200) {
        throw Exception('Falha ao buscar produtos (${response.statusCode})');
      }

      final List<dynamic> decoded = jsonDecode(response.body) as List<dynamic>;
      final fetched = decoded
          .whereType<Map<String, dynamic>>()
          .map(Product.fromJson)
          .toList();

      _products
        ..clear()
        ..addAll(fetched);
    } catch (e) {
      _errorMessage = 'Erro ao carregar produtos: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleFavorite(int index) {
    if (index < 0 || index >= _products.length) {
      return;
    }

    _products[index].favorite = !_products[index].favorite;
    notifyListeners();
  }
}
