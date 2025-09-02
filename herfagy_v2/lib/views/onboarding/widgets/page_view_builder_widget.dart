import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/onboarding_view_model.dart';

class PageViewBuilderWidget extends StatelessWidget {
  const PageViewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<OnboardingViewModel>();
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
              child: Lottie.asset(
                page.animation,
                // frameRate: FrameRate.max,
                addRepaintBoundary: true,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              page.description,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
