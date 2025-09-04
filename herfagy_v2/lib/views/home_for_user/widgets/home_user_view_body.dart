import 'package:flutter/material.dart';

import '../../../models/categoty_model.dart';
import 'custom_sliver_app_bar.dart';

class HomeUserViewBody extends StatelessWidget {
  const HomeUserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final List<CategoryModel> _categories = [
      CategoryModel(title: "نجار", icon: Icons.handyman, color: Colors.orange),
      CategoryModel(
        title: "سباك",
        icon: Icons.water_damage,
        color: Colors.blue,
      ),
      CategoryModel(
        title: "كهربائي",
        icon: Icons.flash_on,
        color: Colors.yellow,
      ),
      CategoryModel(
        title: "دهان",
        icon: Icons.format_paint,
        color: Colors.purple,
      ),
      CategoryModel(title: "حداد", icon: Icons.build, color: Colors.green),
    ];

    return CustomScrollView(
      slivers: [
        CustomSilverAppBar(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),
        SliverToBoxAdapter(
          child: SectionHeader(screenWidth: screenWidth, title: "الفئات"),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: screenHeight * 0.12,
            child: CategoryItemsListViewBuilder(
              screenWidth: screenWidth,
              categories: _categories,
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryItemsListViewBuilder extends StatelessWidget {
  const CategoryItemsListViewBuilder({
    super.key,
    required this.screenWidth,
    required List<CategoryModel> categories,
  }) : _categories = categories;

  final double screenWidth;
  final List<CategoryModel> _categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      itemCount: _categories.length,
      itemBuilder: (context, index) {
        var category = _categories[index];
        return CategoryItem(screenWidth: screenWidth, category: category);
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.screenWidth,
    required this.category,
  });

  final double screenWidth;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.25,
      margin: EdgeInsets.only(right: screenWidth * 0.04),
      decoration: BoxDecoration(
        color: category.color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(category.icon, size: 32, color: category.color),
          const SizedBox(height: 6),
          Text(
            category.title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.screenWidth,
    required this.title,
    this.actionText,
    this.onActionTap,
  });
  final double screenWidth;
  final String title;
  final String? actionText;
  final VoidCallback? onActionTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.055,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
          ),
          if (actionText != null)
            GestureDetector(
              onTap: onActionTap,
              child: Text(
                actionText!,
                style: const TextStyle(color: Colors.blue),
              ),
            ),
        ],
      ),
    );
  }
}
