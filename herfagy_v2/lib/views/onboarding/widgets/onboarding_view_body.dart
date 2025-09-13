import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/views/login/login_view.dart';
import 'package:herfagy_v2/views/onboarding/widgets/custom_animated_skip_button.dart';
import 'package:herfagy_v2/views/user_type_selection/user_type_selection_view.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/onboarding_view_model.dart';
import '../../../views/onboarding/widgets/page_view_builder_widget.dart';
import 'custom_elevated_button.dart';
import '../../../views/onboarding/widgets/dot_indictaor_list_view_builder.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<OnboardingViewModel>();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomAnimatedSkipButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                  );
                },
              ),
              const Expanded(child: PageViewBuilderWidget()),
              const SizedBox(height: 32),
              const DotIndicatorsListViewBuilder(),
              const SizedBox(height: 24),
              CustomElevatedButton(
                onTap: () {
                  viewModel.currentPageIndex == viewModel.pages.length - 1
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                        )
                      : viewModel.onNextPage();
                },
                text: context.localization.next,
                fontSize: 22,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
