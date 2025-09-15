import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/auth_handler.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/utils/size_config.dart';
import 'package:herfagy_v2/viewmodels/supabase/auth_view_model.dart';
import 'package:herfagy_v2/views/crafter/crafter_view.dart';
import 'package:herfagy_v2/views/forget_password/forget_password_view.dart';
import 'package:herfagy_v2/views/user_type_selection/user_type_selection_view.dart';
import 'package:herfagy_v2/views/user_type_selection/widgets/user_type_selection_view_body.dart';
import 'package:provider/provider.dart';

import '../../user/user_view.dart';

class CustomLoginSignUpButton extends StatelessWidget {
  const CustomLoginSignUpButton({
    super.key,

    required this.text,
    required this.isLogin,
    this.email,
    this.password,
    required this.isResetPassword,
    this.username,
  });
  final String text;

  final bool isLogin;
  final bool isResetPassword;
  final TextEditingController? email;
  final TextEditingController? password;
  final TextEditingController? username;

  void _checkFieldAndShow(BuildContext context, String? value, String message) {
    if (value == null || value.isEmpty) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
      throw Exception("Field validation failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final localization = context.localization;
    final authMv = Provider.of<AuthViewModel>(context);
    return ElevatedButton(
      onPressed: () async {
        try {
          if (!isResetPassword) {
            _checkFieldAndShow(context, email!.text, localization.enterEmail);
            _checkFieldAndShow(
              context,
              password?.text,
              localization.enterPassword,
            );

            if (!isLogin) {
              _checkFieldAndShow(
                context,
                username?.text,
                localization.enterUsername,
              );
            }
          } else {
            _checkFieldAndShow(context, email?.text, localization.enterEmail);
          }

          if (isLogin) {
            AuthHandler.handleAuth(
              context: context,
              action: () =>
                  authMv.signIn(email: email!.text, password: password!.text),
              onSuccessScreen: () {
                final role = authMv.profile?.role;

                if (role == "User") {
                  return const UserView();
                } else if (role == "Crafter") {
                  return const CrafterView();
                } else {
                  return const UserTypeSelectionViewBody();
                }
              },
            );
          } else if (!isLogin && !isResetPassword) {
            AuthHandler.handleAuth(
              context: context,
              action: () => authMv.signUp(
                username: username!.text,
                email: email!.text,
                password: password!.text,
              ),
              onSuccessScreen: () => UserTypeSelectionView(),
            );
          } else if (isResetPassword) {
            AuthHandler.handleAuth(
              context: context,
              action: () =>
                  context.read<AuthViewModel>().resetPassword(email!.text),
              onSuccessScreen: () => const ForgetPasswordView(),
            );
          }
        } catch (e) {
          debugPrint('$e');
        }
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          SizeConfig.screenWidth,
          SizeConfig.height(fraction: 0.06),
        ),
      ),
      child: authMv.isLoading
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Text(
              text,
              style: TextStyle(fontSize: SizeConfig.width(fraction: 0.06)),
            ),
    );
  }
}
