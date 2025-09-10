import 'package:flutter/material.dart';

import '../../../../models/categoty_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.screenWidth,
    required this.category,
    this.paddingAll,
    this.marginRight,
  });

  final double screenWidth;
  final CategoryModel category;
  final double? paddingAll;
  final double? marginRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.25,
      padding: EdgeInsets.all(paddingAll ?? screenWidth * 0.03),
      margin: EdgeInsets.only(right: marginRight ?? screenWidth * 0.04),
      decoration: BoxDecoration(
        color: category.color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black.withValues(alpha: 0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(category.icon, size: 32, color: category.color),
          const SizedBox(height: 6),
          Text(
            category.title,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
