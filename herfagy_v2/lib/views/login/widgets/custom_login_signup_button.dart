import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/auth_handler.dart';
import 'package:herfagy_v2/viewmodels/supabase/auth_view_model.dart';
import 'package:herfagy_v2/views/forget_password/forget_password_view.dart';
import 'package:herfagy_v2/views/user_type_selection.dart';
import 'package:provider/provider.dart';

import '../../user/user_view.dart';

class CustomLoginSignUpButton extends StatelessWidget {
  const CustomLoginSignUpButton({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.text,
    required this.isLogin,
    this.email,
    this.password,
    required this.isResetPassword,
    this.username,
  });
  final String text;
  final double screenWidth;
  final double screenHeight;
  final bool isLogin;
  final bool isResetPassword;
  final String? email;
  final String? password;
  final String? username;

  @override
  Widget build(BuildContext context) {
    final authMv = Provider.of<AuthViewModel>(context, listen: false);
    return ElevatedButton(
      onPressed: () async {
        if (isLogin) {
          AuthHandler.handleAuth(
            context: context,
            action: () => authMv.signIn(email: email!, password: password!),
            onSuccessScreen: () => UserView(),
          );
        } else if (!isLogin && !isResetPassword) {
          AuthHandler.handleAuth(
            context: context,
            action: () => authMv.signUp(
              username: username!,
              email: email!,
              password: password!,
            ),
            onSuccessScreen: () => UserTypeSelection(),
          );
        } else if (isResetPassword) {
          AuthHandler.handleAuth(
            context: context,
            action: () => authMv.resetPassword(email!),
            onSuccessScreen: () =>
                ForgetPasswordView(),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        minimumSize: Size(screenWidth, screenHeight * 0.06),
      ),
      child: authMv.isLoading
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.05,
              ),
            ),
    );
  }
}
