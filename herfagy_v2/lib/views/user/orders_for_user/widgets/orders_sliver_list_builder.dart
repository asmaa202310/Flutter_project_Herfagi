import 'package:flutter/material.dart';

import '../../../../models/old/order_model.dart';
import 'order_card.dart';

class OrdersSliverListBuilder extends StatelessWidget {
  const OrdersSliverListBuilder({super.key, required this.orders});

  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final order = orders[index];
        return OrderCard(order: order);
      }, childCount: orders.length),
    );
  }
}
