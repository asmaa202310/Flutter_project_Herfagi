import 'package:flutter/material.dart';
import '../../../../models/old/order_model.dart';
import '../../../user/orders_for_user/widgets/order_card_for_user.dart';

class OrdersSliverListBuilderForCrafter extends StatelessWidget {
  const OrdersSliverListBuilderForCrafter({super.key, required this.orders});

  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final order = orders[index];
        return OrderCardForUser(order: order);
      }, childCount: orders.length),
    );
  }
}
