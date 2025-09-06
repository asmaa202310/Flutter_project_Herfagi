import 'package:flutter/material.dart';

import '../../../../models/order_model.dart';
import 'order_card.dart';

class OrdersListViewBuilder extends StatelessWidget {
  const OrdersListViewBuilder({super.key, required this.orders});

  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      itemBuilder: (context, index) {
        var order = orders[index];
        return OrderCard(order: order);
      },
    );
  }
}
