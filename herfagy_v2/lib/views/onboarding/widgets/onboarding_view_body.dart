import 'package:flutter/material.dart';
import 'package:herfagy_v2/viewmodels/onboarding_view_model.dart';
import 'package:herfagy_v2/views/login/login_view.dart';
import 'package:herfagy_v2/views/onboarding/widgets/custom_animated_skip_button.dart';
import 'package:provider/provider.dart';
import '../../../views/onboarding/widgets/page_view_builder_widget.dart';
import '../../../views/onboarding/widgets/custom_button.dart';
import '../../../views/onboarding/widgets/dot_indictaor_list_view_builder.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            CustomAnimatedSkipButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
            ),
            const Expanded(child: PageViewBuilderWidget()),
            const SizedBox(height: 32),
            const DotIndicatorsListViewBuilder(),
            const SizedBox(height: 24),
            const CustomButton(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
