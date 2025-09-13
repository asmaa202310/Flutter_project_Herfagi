import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'reject_accept_button.dart';
import '../../../../models/request_model.dart';
import '../../../../viewmodels/home_crafter_view_model.dart';
import '../../../../utils/localization_extension.dart';

class BottomSheetActionButtons extends StatelessWidget {
  const BottomSheetActionButtons({super.key, required this.request});

  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RejectAcceptButton(
          buttonColor: Colors.green,
          text: context.localization.accept,
          icon: Icons.check,
          onTap: () {
            context.read<RequestsProvider>().acceptRequest(request);
            Navigator.pop(context);
          },
        ),
        const SizedBox(width: 10),
        RejectAcceptButton(
          buttonColor: Colors.red,
          text: context.localization.reject,
          icon: Icons.close,
          onTap: () {
            context.read<RequestsProvider>().rejectRequest(request);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
