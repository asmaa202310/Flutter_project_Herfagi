import 'package:flutter/material.dart';
import '../models/old/onboarding_model.dart';

class OnboardingViewModel extends ChangeNotifier {
  final pageController = PageController();

  final List<OnboardingModel> pages = const [
    OnboardingModel(
      description: "ابن دخلك أو خلى حياتك أسهل مع تطبيق حرفجى",
      animation: "assets/lottie/Relax.json",
    ),
    OnboardingModel(
      description: "خدمات موثوقة - تقييمات و مراجعات تبنى الثقة",
      animation: "assets/lottie/RatingCharacter.json",
    ),
    OnboardingModel(
      description: "كل الحرفيين فى مكان واحد - اطلب او قدم خدمتك بسهولة",
      animation: "assets/lottie/checklist.json",
    ),
  ];

  int currentPageIndex = 0;
  void onPageChanged(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  void onNextPage() {
    if (currentPageIndex < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void onPreviousPage() {
    if (currentPageIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> onLastPage() async {
    currentPageIndex = pages.length - 1;
    await pageController.animateToPage(
      currentPageIndex,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeIn,
    );
    notifyListeners();
  }
}
