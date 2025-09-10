import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../models/request_model.dart';
import '../../../../viewmodels/home_crafter_view_model.dart';
import 'reject_accept_button.dart';

class BottomSheetActionButtons extends StatelessWidget {
  const BottomSheetActionButtons({
    super.key,
    required this.request,
  });

  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<RequestsProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RejectAcceptButton(
          buttonColor: Colors.green,
          text: "قبول",
          icon: Icons.check,
          onTap: () {
            provider.acceptRequest(request);
            Navigator.pop(context);
          },
        ),
        const SizedBox(width: 10),
        RejectAcceptButton(
          buttonColor: Colors.red,
          text: "رفض",
          icon: Icons.close,
          onTap: () {
            provider.rejectRequest(request);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
