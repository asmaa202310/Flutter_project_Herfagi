import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../viewmodels/home_crafter_view_model.dart';

class YourProgressWidget extends StatelessWidget {
  const YourProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "تقدمك",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Selector<ProgressProvider, int>(
          selector: (_, vm) => (vm.progress * 100).toInt(),
          builder: (_, percent, __) {
            return Text(
              "$percent%",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            );
          },
        ),
      ],
    );
  }
}
