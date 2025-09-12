import 'package:flutter/material.dart';
import '/utils/size_config.dart';
import '../../../../models/old/categoty_model.dart';
import 'category_item.dart';

class CategoryItemsListViewBuilder extends StatelessWidget {
  const CategoryItemsListViewBuilder({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizedBox(
      height: SizeConfig.height(fraction: 0.12),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: SizeConfig.width(fraction: 0.05)),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var category = categories[index];
          return CategoryItem(category: category);
        },
      ),
    );
  }
}
