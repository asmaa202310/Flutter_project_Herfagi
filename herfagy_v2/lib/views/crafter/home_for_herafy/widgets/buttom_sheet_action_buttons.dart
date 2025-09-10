import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../viewmodels/home_crafter_view_model.dart';
import 'reject_accept_button.dart';

class BottomSheetActionButtons extends StatelessWidget {
  const BottomSheetActionButtons({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<RequestsProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RejectAcceptButton(
          buttonColor: Colors.green,
          index: index,
          text: "قبول",
          icon: Icons.check,
          onTap: () {
            provider.acceptRequest(index);
            Navigator.pop(context);
          },
        ),
        const SizedBox(width: 10),
        RejectAcceptButton(
          buttonColor: Colors.red,
          index: index,
          text: "رفض",
          icon: Icons.close,
          onTap: () {
            provider.rejectRequest(index);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
