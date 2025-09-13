import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../viewmodels/home_crafter_view_model.dart';

class YourProgressWidget extends StatelessWidget {
  const YourProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.localization.yourProgress,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Selector<ProgressProvider, int>(
          selector: (_, vm) => (vm.progress * 100).toInt(),
          builder: (_, percent, __) {
            final locale = Localizations.localeOf(context).languageCode;
            final formatted = NumberFormat.decimalPattern(
              locale,
            ).format(percent);
            return Text(
              context.localization.progressPercent(formatted),
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
