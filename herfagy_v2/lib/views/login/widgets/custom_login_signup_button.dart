import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/auth_handler.dart';
import 'package:herfagy_v2/viewmodels/supabase/auth_view_model.dart';
import 'package:herfagy_v2/views/crafter/crafter_view.dart';
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
  final TextEditingController? email;
  final TextEditingController? password;
  final TextEditingController? username;

  void _checkFieldAndShow(BuildContext context, String? value, String message) {
    if (value == null || value.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
      throw Exception("Field validation failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    final authMv = Provider.of<AuthViewModel>(context);
    return ElevatedButton(
      onPressed: () async {
        try {
          if (!isResetPassword) {
            _checkFieldAndShow(
              context,
              email!.text,
              "الرجاء إدخال البريد الإلكتروني",
            );
            _checkFieldAndShow(
              context,
              password?.text,
              "الرجاء إدخال كلمة المرور",
            );

            if (!isLogin) {
              _checkFieldAndShow(
                context,
                username?.text,
                "الرجاء إدخال اسم المستخدم",
              );
            }
          } else {
            _checkFieldAndShow(
              context,
              email?.text,
              "الرجاء إدخال البريد الإلكتروني",
            );
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
                  return const UserTypeSelection();
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
              onSuccessScreen: () => UserTypeSelection(),
            );
          } else if (isResetPassword) {
            AuthHandler.handleAuth(
              context: context,
              action: () => authMv.resetPassword(email!.text),
              onSuccessScreen: () => ForgetPasswordView(),
            );
          }
        } catch (e) {
          debugPrint('$e');
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
