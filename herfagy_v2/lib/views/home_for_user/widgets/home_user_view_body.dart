import 'package:flutter/material.dart';

import 'custom_sliver_app_bar.dart';

class HomeUserViewBody extends StatelessWidget {
  const HomeUserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return CustomScrollView(
      slivers: [
        CustomSilverAppBar(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),
      ],
    );
  }
}
