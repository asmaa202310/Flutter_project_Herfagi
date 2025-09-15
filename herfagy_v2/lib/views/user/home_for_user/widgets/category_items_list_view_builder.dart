import 'package:flutter/material.dart';
import '/utils/size_config.dart';
import 'category_item.dart';
import 'package:herfagy_v2/models/service.dart';

class CategoryItemsListViewBuilder extends StatelessWidget {
  final List<Service> services;

  const CategoryItemsListViewBuilder({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizedBox(
      height: SizeConfig.height(fraction: 0.12),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: SizeConfig.width(fraction: 0.05)),
        itemCount: services.length,
        itemBuilder: (context, index) {
          var category = services[index];
          return CategoryItem(category: category);
        },
      ),
    );
  }
}
