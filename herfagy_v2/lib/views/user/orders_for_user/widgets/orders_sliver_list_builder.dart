import 'package:flutter/material.dart';
import 'package:herfagy_v2/views/user/orders_for_user/widgets/order_details_bottom_sheet.dart';
import '../../../../models/old/order_model.dart';
import 'order_card.dart';

class OrdersSliverListBuilder extends StatelessWidget {
  const OrdersSliverListBuilder({
    super.key,
    required this.orders,
    required this.viewerType,
  });

  final List<OrderModel> orders;
  final OrderViewerType viewerType;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final order = orders[index];
        return OrderCard(order: order, viewerType: viewerType);
      }, childCount: orders.length),
    );
  }
}
