import 'package:flutter/material.dart';
import '/views/login/widgets/custom_social_button.dart';

class CustomSocialButtonsContainer extends StatelessWidget {
  const CustomSocialButtonsContainer({super.key});

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
          onTap: () {},
        ),
        SizedBox(width: screenWidth * 0.08),
        CustomSocailButton(
          raduis: screenWidth * 0.06,
          logo: 'assets/images/google_logo.png',
          onTap: () {},
        ),
        const Spacer(),
      ],
    );
  }
}
