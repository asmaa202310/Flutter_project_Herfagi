import 'package:flutter/material.dart';
import '/utils/size_config.dart';
import '../../../../models/old/categoty_model.dart';
import '../../../../utils/get_localize_title.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    this.paddingAll,
    this.marginRight,
  });

  final CategoryModel category;
  final double? paddingAll;
  final double? marginRight;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      width: SizeConfig.width(fraction: 0.25),
      padding: EdgeInsets.all(paddingAll ?? SizeConfig.width(fraction: 0.03)),
      margin: EdgeInsets.only(
        right: marginRight ?? SizeConfig.width(fraction: 0.04),
      ),
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
            GetLocalizeTitle.getLocalizedTitle(context, category.key),
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
