import 'package:flutter/material.dart';

import '../../../viewmodels/home_user_view_model.dart';
import 'crafter_item.dart';

class TopCraftersListViewBuilder extends StatelessWidget {
  const TopCraftersListViewBuilder({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.crafters,
  });

  final double screenWidth;
  final double screenHeight;
  final List crafters;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        itemCount: HomeUserViewModel.topCrafters.length,
        itemBuilder: (BuildContext context, int index) {
          var crafter = crafters[index];
          return CrafterItem(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            crafter: crafter,
          );
        },
      ),
    );
  }
}
