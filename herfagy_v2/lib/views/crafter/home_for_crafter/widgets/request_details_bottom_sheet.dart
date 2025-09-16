import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/order.dart';
import 'package:herfagy_v2/models/service.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/order_operation_view_model.dart';
import 'package:herfagy_v2/views/crafter/home_for_crafter/widgets/buttom_sheet_action_buttons.dart';
import 'package:provider/provider.dart';

class RequestDetailsBottomSheet extends StatelessWidget {
  const RequestDetailsBottomSheet({super.key, required this.request});

  final Order request;

  @override
  Widget build(BuildContext context) {
    final orderVM = Provider.of<OrderOperationViewModel>(context, listen: false);

    return FutureBuilder(
      future: Future.wait([
        orderVM.getProfile(request.customerId),
        orderVM.getServiceForOrder(request),
      ]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final customer = snapshot.data![0];
        final service = snapshot.data![1] as Service;

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.localization.serviceDetails,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Text("${context.localization.service}: ${service.name}"),
              Text("${context.localization.customer}: ${customer.username}"),
              Text("${context.localization.date}: ${request.date.day}/${request.date.month}/${request.date.year}"),
              const SizedBox(height: 10),
              Text("${context.localization.description}: ${request.details}"),
              const SizedBox(height: 20),
              BottomSheetActionButtons(order: request),
            ],
          ),
        );
      },
    );
  }
}
