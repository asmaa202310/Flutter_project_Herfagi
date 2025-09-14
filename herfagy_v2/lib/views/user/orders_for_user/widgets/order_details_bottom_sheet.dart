import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/order.dart';
import 'package:herfagy_v2/models/service.dart';
import 'package:herfagy_v2/views/crafter/orders_for_crafter/widgets/custom_text_close_button.dart';
import '../../../crafter/orders_for_crafter/widgets/order_status_widget.dart';
import '/utils/localization_extension.dart';

enum OrderViewerType { user, crafter }

class OrderDetailsBottomSheet extends StatelessWidget {
  const OrderDetailsBottomSheet({
    super.key,
    required this.order,
    required this.viewerType,
  });

  final Order order;
  final OrderViewerType viewerType;

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;

    final String personLabel = viewerType == OrderViewerType.user
        ? localization.craftsman
        : localization.customer;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localization.serviceDetails,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // Service Name
          FutureBuilder<Service>(
            future: order.getService(),
            builder: (context, snapshot) {
              final serviceName = snapshot.hasData ? snapshot.data!.name : "...";
              return Text(
                "${localization.service}: $serviceName",
                style: const TextStyle(fontSize: 16),
              );
            },
          ),
          const SizedBox(height: 8),
          // Person Name
          FutureBuilder<String>(
            future: order.person(viewerType == OrderViewerType.user ? "user" : "crafter"),
            builder: (context, snapshot) {
              final personName = snapshot.hasData ? snapshot.data! : "...";
              return Text(
                "$personLabel: $personName",
                style: const TextStyle(fontSize: 16),
              );
            },
          ),
          const SizedBox(height: 8),
          Text(
            "${localization.date}: ${order.date}",
            style: TextStyle(color: Colors.grey[700], fontSize: 16),
          ),
          const SizedBox(height: 8),
          OrderStatusWidget(order: order),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          Text(
            "${localization.description}:",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            order.details,
            style: TextStyle(fontSize: 15, color: Colors.grey[700]),
          ),
          const SizedBox(height: 24),
          const CustomTextCloseButton(),
        ],
      ),
    );
  }
}
