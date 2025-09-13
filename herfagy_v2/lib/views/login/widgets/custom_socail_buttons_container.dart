import 'package:flutter/material.dart';
import 'package:herfagy_v2/setup.dart';
import 'package:herfagy_v2/viewmodels/supabase/auth_facebook_model_view.dart';
import 'package:herfagy_v2/viewmodels/supabase/auth_google_model_view.dart';
import '/views/login/widgets/custom_social_button.dart';

class CustomSocialButtonsContainer extends StatefulWidget {
  const CustomSocialButtonsContainer({super.key});

  @override
  State<CustomSocialButtonsContainer> createState() =>
      _CustomSocialButtonsContainerState();
}

class _CustomSocialButtonsContainerState
    extends State<CustomSocialButtonsContainer> {
  Future<void> _googleSignIn() async {
    try {
      final authService = sl<AuthGoogleModelView>();
      await authService.signInWithGoogle();
    } catch (e) {
      debugPrint("$e");
    }
  }

  Future<void> _facebookSignIn() async {
    try {
      final authService = sl<AuthFacebookModelView>();
      await authService.signInWithFacebook();
    } catch (e) {
      debugPrint("$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Spacer(),
        CustomSocailButton(
          raduis: screenWidth * 0.07,
          logo: 'assets/images/facebook_logo.png',
          onTap: () async {
            _facebookSignIn();
          },
        ),
        SizedBox(width: screenWidth * 0.08),
        CustomSocailButton(
          raduis: screenWidth * 0.06,
          logo: 'assets/images/google_logo.png',
          onTap: () async {
            _googleSignIn();
          },
        ),
        const Spacer(),
      ],
    );
  }
}
