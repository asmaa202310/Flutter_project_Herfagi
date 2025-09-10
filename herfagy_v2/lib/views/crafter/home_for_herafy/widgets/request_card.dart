import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../models/request_model.dart';
import '../../../../viewmodels/home_crafter_view_model.dart';
import 'custom_icon_button.dart';
import 'request_details_bottom_sheet.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({super.key, required this.request, required this.index});

  final RequestModel request;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      color: Colors.white,
      shadowColor: Colors.blue.withValues(alpha: 0.5),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        leading: const Icon(Icons.assignment_outlined, color: Colors.blue),
        title: Text(request.service),
        subtitle: Text("العميل: ${request.customerName}\n${request.date}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomIconButton(
              index: index,
              onTap: () => _showRequestDetails(context),
              icon: Icons.info_outline,
              color: Colors.orange,
            ),
            CustomIconButton(
              index: index,
              onTap: () =>
                  context.read<RequestsProvider>().acceptRequest(index),
              icon: Icons.check,
              color: Colors.green,
            ),
            CustomIconButton(
              index: index,
              onTap: () =>
                  context.read<RequestsProvider>().rejectRequest(index),
              icon: Icons.close,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  void _showRequestDetails(BuildContext context) {
    final requestsProvider = context.read<RequestsProvider>();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return ChangeNotifierProvider.value(
          value: requestsProvider,
          child: RequestDetailsBottomSheet(request: request, index: index),
        );
      },
    );
  }
}
