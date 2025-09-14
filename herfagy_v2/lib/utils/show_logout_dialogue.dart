import 'package:flutter/material.dart';
import 'package:herfagy_v2/setup.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/utils/size_config.dart';
import 'package:herfagy_v2/viewmodels/supabase/auth_facebook_model_view.dart';
import 'package:herfagy_v2/viewmodels/supabase/auth_google_model_view.dart';
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
              final authViewModel = context.read<AuthViewModel>();
              final authGoogle = sl<AuthGoogleModelView>();
              final authFacebook = sl<AuthFacebookModelView>();

              if (authGoogle.profile != null) {
                await authGoogle.signOut();
                debugPrint("signOut for Google account");
              } else if (authFacebook.profile != null) {
                await authFacebook.signOut();
                debugPrint("signOut for Facebook account");
              } else {
                await authViewModel.signOut();
                debugPrint("signOut for email");
              }

              if (!context.mounted) return;

              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginView()),
                (route) => false,
              );

              final localization = context.localization;
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
