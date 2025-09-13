import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/utils/size_config.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      final localization = context.localization;
      SizeConfig.init(context);
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(
          localization.logout,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(localization.logoutConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(localization.cancel),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text(localization.logoutSuccess)),
                );
            },
            child: Text(
              localization.confirm,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
