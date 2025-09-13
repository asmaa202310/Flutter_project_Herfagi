import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/utils/size_config.dart';
import 'package:herfagy_v2/views/login/login_view.dart';
import 'package:provider/provider.dart';
import 'package:herfagy_v2/viewmodels/supabase/auth_view_model.dart';

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
            onPressed: () async {
              Navigator.of(context).pop();

              // نستخدم AuthViewModel بدلاً من Supabase مباشرة
              final authViewModel = context.read<AuthViewModel>();
              await authViewModel.signOut();

              if (!context.mounted) return;

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginView()),
                (route) => false,
              );

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
