import 'package:flutter/material.dart';
import '/utils/localization_extension.dart';
import '/viewmodels/language_view_model.dart';
import '/viewmodels/onboarding_view_model.dart';
import 'package:provider/provider.dart';
import '../../../utils/size_config.dart';

class CustomAnimatedSkipButton extends StatelessWidget {
  const CustomAnimatedSkipButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Selector<OnboardingViewModel, bool>(
      selector: (context, viewModel) =>
          viewModel.currentPageIndex == viewModel.pages.length - 1,
      builder: (context, isLastPage, _) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            final beginOffset =
                context.read<LanguageViewModel>().locale.languageCode == 'ar'
                ? const Offset(0.0, -30.0) // Start from the left
                : const Offset(0.0, 0.0); // Start from the right
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: beginOffset,
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: isLastPage
              ? const SizedBox(key: ValueKey('empty'), height: 30)
              : GestureDetector(
                  key: const ValueKey('skip'),
                  onTap: onTap,
                  child: Row(
                    children: [
                      Text(
                        context.localization.skip,
                        style: TextStyle(
                          fontSize: SizeConfig.screenWidth > 600 ? 30 : 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
