import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/get_localize_title.dart';
import 'package:herfagy_v2/utils/size_config.dart';
import '../../../crafter/orders_for_crafter/widgets/order_status_widget.dart';
import '../../../user/home_for_user/widgets/custom_order_button.dart';
import '/utils/localization_extension.dart';
import '../../../../models/old/order_model.dart';
import 'order_details_bottom_sheet.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  final OrderViewerType viewerType;

  const OrderCard({super.key, required this.order, required this.viewerType});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    SizeConfig.init(context);

    final String personLabel = viewerType == OrderViewerType.user
        ? localization.craftsman
        : localization.customer;

    return Card(
      color: Colors.white.withValues(alpha: 0.89),
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.height(fraction: 0.01),
        horizontal: SizeConfig.width(fraction: 0.035),
      ),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.width(fraction: 0.035)),
      ),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.width(fraction: 0.035)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${localization.service}: ${GetLocalizeTitle.getLocalizedTitle(context, order.service)}",
              style: TextStyle(
                fontSize: SizeConfig.width(fraction: 0.05),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "$personLabel: ${order.person}",
              style: TextStyle(fontSize: SizeConfig.width(fraction: 0.04)),
            ),
            const SizedBox(height: 8),
            Text(
              "${localization.date}: ${order.date}",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: SizeConfig.width(fraction: 0.04),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                OrderStatusWidget(order: order),
                const Spacer(),
                CustomDetailsButton(
                  borderRaduis: 16,
                  text: localization.details,
                  fontSize: SizeConfig.width(fraction: 0.04),
                  onTap: () => _showOrderDetails(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showOrderDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return OrderDetailsBottomSheet(order: order, viewerType: viewerType);
      },
    );
  }
}
