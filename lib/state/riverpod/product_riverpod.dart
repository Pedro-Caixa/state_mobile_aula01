import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/product.dart';

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier()
      : super([
          Product(name: 'Notebook', price: 3500),
          Product(name: 'Mouse', price: 120),
          Product(name: 'Teclado', price: 250),
          Product(name: 'Monitor', price: 900),
        ]);

  void toggleFavorite(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          Product(
            name: state[i].name,
            price: state[i].price,
            favorite: !state[i].favorite,
          )
        else
          state[i],
    ];
  }
}

final productProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>(
  (ref) => ProductNotifier(),
);
