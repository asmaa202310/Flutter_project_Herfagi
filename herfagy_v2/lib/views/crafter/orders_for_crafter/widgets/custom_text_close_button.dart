import 'package:flutter/material.dart';
import '/utils/localization_extension.dart';

class CustomTextCloseButton extends StatelessWidget {
  const CustomTextCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
            backgroundColor: Colors.grey[200],
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          child: Text(
            localization.close,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
