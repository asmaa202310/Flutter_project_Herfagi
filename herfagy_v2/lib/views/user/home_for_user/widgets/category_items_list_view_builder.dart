import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../viewmodels/home_user_view_model.dart';
import '/utils/size_config.dart';
import 'category_item.dart';

class CategoryItemsListViewBuilder extends StatelessWidget {
  const CategoryItemsListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<HomeUserViewModel>().categories;
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
