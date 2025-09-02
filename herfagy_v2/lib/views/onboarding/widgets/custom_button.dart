import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/onboarding_view_model.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<OnboardingViewModel>();
    final width = MediaQuery.sizeOf(context).width;
    return ElevatedButton(
      onPressed: viewModel.onNextPage,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: Size(width, 50),
      ),
      child: const Text(
        "التالي",
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }
}
