import 'package:flutter/material.dart';
import '../../../../utils/size_config.dart';
import '/utils/get_order_status_extension.dart';
import '../../../../models/old/order_model.dart';
import '/utils/localization_extension.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    SizeConfig.init(context);
    return Row(
      children: [
        Text(
          "${localization.status}: ",
          style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.width(fraction: 0.04),
          ),
        ),
        Text(
          order.status.localizedText(context),
          style: TextStyle(
            color: order.status.color,
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.width(fraction: 0.04),
          ),
        ),
      ],
    );
  }
}
