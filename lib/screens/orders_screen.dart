import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/orders.dart' show Orders;
import 'package:shopapp/widgets/app_drawer.dart';
import 'package:shopapp/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your orders'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: ordersData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(order: ordersData.orders[i]),
      ),
    );
  }
}
