import 'package:flutter/material.dart';
import '/views/crafter/orders_for_crafter/widgets/order_card_for_crafter.dart';
import '../../../../models/old/order_model.dart';

class OrdersSliverListBuilderForCrafter extends StatelessWidget {
  const OrdersSliverListBuilderForCrafter({super.key, required this.orders});

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
