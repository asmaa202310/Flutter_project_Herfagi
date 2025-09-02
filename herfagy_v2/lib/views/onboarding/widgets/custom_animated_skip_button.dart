import 'package:flutter/material.dart';
import 'package:herfagy_v2/viewmodels/onboarding_view_model.dart';
import 'package:provider/provider.dart';

class CustomAnimatedSkipButton extends StatelessWidget {
  const CustomAnimatedSkipButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Selector<OnboardingViewModel, bool>(
      selector: (context, viewModel) =>
          viewModel.currentPageIndex == viewModel.pages.length - 1,
      builder: (context, isLastPage, _) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.5, 0),
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
                      const Text(
                        'تخطى',
                        style: TextStyle(
                          fontSize: 22,
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
