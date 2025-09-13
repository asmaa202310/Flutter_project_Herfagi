import 'package:flutter/material.dart';
import '/utils/localization_extension.dart';

class NoWorkImagesWidget extends StatelessWidget {
  const NoWorkImagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;

    return Center(
      child: Column(
        children: [
          Text(localization.noWorksYet, style: const TextStyle(fontSize: 16)),
          TextButton(
            onPressed: () {},
            child: Text(
              localization.addImagesNow,
              style: const TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
