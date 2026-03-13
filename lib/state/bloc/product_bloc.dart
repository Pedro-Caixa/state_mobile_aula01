import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductsState> {
  ProductBloc() : super(ProductsState(_initialProducts())) {
    on<ToggleFavoriteEvent>((event, emit) {
      final updated = List<Product>.from(state.products);
      final old = updated[event.index];
      updated[event.index] = Product(
        name: old.name,
        price: old.price,
        favorite: !old.favorite,
      );
      emit(ProductsState(updated));
    });
  }

  static List<Product> _initialProducts() => [
        Product(name: 'Notebook', price: 3500),
        Product(name: 'Mouse', price: 120),
        Product(name: 'Teclado', price: 250),
        Product(name: 'Monitor', price: 900),
      ];
}
