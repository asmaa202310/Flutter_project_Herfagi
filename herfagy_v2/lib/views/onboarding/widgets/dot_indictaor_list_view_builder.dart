import 'package:flutter/material.dart';
import '../../../viewmodels/onboarding_view_model.dart';
import '../../onboarding/widgets/custom_dot_indicator.dart';
import 'package:provider/provider.dart';

class DotIndicatorsListViewBuilder extends StatelessWidget {
  const DotIndicatorsListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final pageCount = context.read<OnboardingViewModel>().pages.length;
    return SizedBox(
      height: 10,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: pageCount,
        itemBuilder: (context, index) => Selector<OnboardingViewModel, bool>(
          selector: (context, viewModel) => index == viewModel.currentPageIndex,
          builder: (context, isActive, _) {
            return CustomDotIndicator(isActive: isActive);
          },
        ),
      ),
    );
  }
}
