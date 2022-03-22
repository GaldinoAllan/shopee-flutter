import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/providers/product.dart';
import 'package:shopapp/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return Consumer<Product>(
      builder: (ctx, product, _) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            child: GestureDetector(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  ProductDetailScreen.routeName,
                  arguments: product.id,
                );
              },
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              leading: IconButton(
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
                color: Theme.of(context).colorScheme.secondary,
              ),
              title: Text(
                product.title,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  cart.addItem(
                    product.id,
                    product.price,
                    product.title,
                  );
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Add item to cart!'),
                    duration: const Duration(seconds: 3),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        cart.removeItem(product.id);
                      },
                    ),
                  ));
                },
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        );
      },
    );
  }
}
