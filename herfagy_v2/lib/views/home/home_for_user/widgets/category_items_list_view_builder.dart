import 'package:flutter/material.dart';

import '../../../../models/categoty_model.dart';
import 'category_item.dart';

class CategoryItemsListViewBuilder extends StatelessWidget {
  const CategoryItemsListViewBuilder({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.categories,
  });

  final double screenWidth;
  final double screenHeight;
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.12,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: screenWidth * 0.05),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var category = categories[index];
          return CategoryItem(screenWidth: screenWidth, category: category);
        },
      ),
    );
  }
}
