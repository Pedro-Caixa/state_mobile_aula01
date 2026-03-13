import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../state/riverpod/product_riverpod.dart';

class RiverpodProductsPage extends ConsumerStatefulWidget {
  const RiverpodProductsPage({super.key});

  @override
  ConsumerState<RiverpodProductsPage> createState() =>
      _RiverpodProductsPageState();
}

class _RiverpodProductsPageState extends ConsumerState<RiverpodProductsPage> {
  bool showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productProvider);
    final favoriteCount = products.where((product) => product.favorite).length;
    final visibleEntries = products.asMap().entries.where((entry) {
      if (!showOnlyFavorites) {
        return true;
      }
      return entry.value.favorite;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Produtos')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Row(
              children: [
                Text(
                  'Favoritos: $favoriteCount/${products.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SwitchListTile(
            title: const Text('Mostrar apenas favoritos'),
            value: showOnlyFavorites,
            onChanged: (value) => setState(() => showOnlyFavorites = value),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: visibleEntries.length,
              itemBuilder: (context, index) {
                final entry = visibleEntries[index];
                final originalIndex = entry.key;
                final product = entry.value;
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  color: product.favorite ? Colors.amber.shade50 : null,
                  child: ListTile(
                    title: Text(
                      product.name,
                      style: TextStyle(
                        fontWeight:
                            product.favorite ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    subtitle: Text('R\$ ${product.price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: Icon(
                        product.favorite ? Icons.star : Icons.star_border,
                        color: product.favorite ? Colors.amber : null,
                      ),
                      onPressed: () => ref
                          .read(productProvider.notifier)
                          .toggleFavorite(originalIndex),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
