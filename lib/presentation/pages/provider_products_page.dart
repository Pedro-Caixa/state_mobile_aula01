import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/provider/product_provider.dart';

class ProviderProductsPage extends StatefulWidget {
  const ProviderProductsPage({super.key});

  @override
  State<ProviderProductsPage> createState() => _ProviderProductsPageState();
}

class _ProviderProductsPageState extends State<ProviderProductsPage> {
  bool showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();
    final products = productProvider.products;
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
                      onPressed: () => productProvider.toggleFavorite(originalIndex),
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
