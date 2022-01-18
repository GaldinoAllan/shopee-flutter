import 'package:flutter/material.dart';
import 'package:shopapp/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyShop"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: ProductsGrid(),
      ),
    );
  }
}
