import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/get_localize_title.dart';
import '../../../user/home_for_user/widgets/custom_order_button.dart';
import '/utils/localization_extension.dart';
import '../../../../models/old/order_model.dart';
import 'order_details_bottom_sheet_for_crafter.dart';
import 'order_status_widget.dart';

class OrderCardForCrafter extends StatelessWidget {
  final OrderModel order;

  const OrderCardForCrafter({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;

    return Card(
      color: Colors.white.withValues(alpha: 0.89),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${localization.service}: ${GetLocalizeTitle.getLocalizedTitle(context, order.service)}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${localization.customer}: ${order.person}",
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              "${localization.date}: ${order.date}",
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                OrderStatusWidget(order: order),
                const Spacer(),
                CustomDetailsButton(
                  borderRaduis: 16,
                  text: localization.details,
                  fontSize: 14,
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
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return OrderDetailsBottomSheetForCrafter(order: order);
      },
    );
  }
}
