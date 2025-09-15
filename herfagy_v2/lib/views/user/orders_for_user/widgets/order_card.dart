import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/order.dart';
import 'package:herfagy_v2/models/service.dart';
import 'package:herfagy_v2/utils/size_config.dart';
import '../../../../constants/app_colors.dart';
import '../../../crafter/orders_for_crafter/widgets/order_status_widget.dart';
import '../../../user/home_for_user/widgets/custom_order_button.dart';
import '/utils/localization_extension.dart';
import 'order_details_bottom_sheet.dart';

class OrderCard extends StatelessWidget {
  final Order order;
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
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.kPrimarColorDark
          : AppColors.kButtonsForegroundColorLight.withValues(alpha: 0.89),
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
            // Service Name
            FutureBuilder<Service>(
              future: order.getService(),
              builder: (context, snapshot) {
                final serviceName = snapshot.hasData
                    ? snapshot.data!.name
                    : "...";
                return Text(
                  "${localization.service}: $serviceName",
                  style: TextStyle(
                    fontSize: SizeConfig.width(fraction: 0.05),
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            // Person Name
            FutureBuilder<String>(
              future: order.person(
                viewerType == OrderViewerType.user ? "user" : "crafter",
              ),
              builder: (context, snapshot) {
                final personName = snapshot.hasData ? snapshot.data! : "...";
                return Text(
                  "$personLabel: $personName",
                  style: TextStyle(fontSize: SizeConfig.width(fraction: 0.04)),
                );
              },
            ),
            const SizedBox(height: 8),
            // Date
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
