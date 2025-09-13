import 'package:flutter/material.dart';
import '/utils/localization_extension.dart';

class NoReviewsWidget extends StatelessWidget {
  const NoReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.rate_review_outlined, size: 50, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            localization.noReviewsYet,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
