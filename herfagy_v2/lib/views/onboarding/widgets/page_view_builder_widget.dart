import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import '/utils/size_config.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/onboarding_view_model.dart';

class PageViewBuilderWidget extends StatelessWidget {
  const PageViewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<OnboardingViewModel>();
    SizeConfig.init(context);
    String getLocalizedDescription(OnboardingDescription desc) {
      switch (desc) {
        case OnboardingDescription.onboardingDesc1:
          return context.localization.onboardingDesc1;
        case OnboardingDescription.onboardingDesc2:
          return context.localization.onboardingDesc2;
        case OnboardingDescription.onboardingDesc3:
          return context.localization.onboardingDesc3;
      }
    }

    return PageView.builder(
      controller: viewModel.pageController,
      onPageChanged: viewModel.onPageChanged,
      itemCount: viewModel.pages.length,
      itemBuilder: (context, index) {
        final page = viewModel.pages[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Lottie.asset(page.animation, addRepaintBoundary: true),
            ),
            SizedBox(height: SizeConfig.height(fraction: 0.01)),
            Text(
              getLocalizedDescription(page.description),
              style: TextStyle(
                fontSize: SizeConfig.screenWidth > 600 ? 30 : 24,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
