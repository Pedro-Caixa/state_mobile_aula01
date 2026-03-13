
import 'package:flutter/material.dart';
import 'provider_page.dart';
import 'riverpod_page.dart';
import 'bloc_page.dart';
import 'provider_products_page.dart';
import 'riverpod_products_page.dart';
import 'bloc_products_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("State Management Examples")),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text('Contadores',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: const Text("Provider — Contador"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProviderPage()),
            ),
          ),
          ListTile(
            title: const Text("Riverpod — Contador"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const RiverpodPage()),
            ),
          ),
          ListTile(
            title: const Text("BLoC — Contador"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const BlocPage()),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Text('Produtos',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: const Text("Provider — Lista de Produtos"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProviderProductsPage()),
            ),
          ),
          ListTile(
            title: const Text("Riverpod — Lista de Produtos"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const RiverpodProductsPage()),
            ),
          ),
          ListTile(
            title: const Text("BLoC — Lista de Produtos"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const BlocProductsPage()),
            ),
          ),
        ],
      ),
    );
  }
}
