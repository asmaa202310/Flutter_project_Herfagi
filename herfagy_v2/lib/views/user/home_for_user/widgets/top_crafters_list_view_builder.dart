import 'package:flutter/material.dart';
import '/utils/size_config.dart';
import '../../../../viewmodels/home_user_view_model.dart';
import 'crafter_item.dart';

class TopCraftersListViewBuilder extends StatelessWidget {
  const TopCraftersListViewBuilder({super.key, required this.crafters});

  final List crafters;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizedBox(
      height: SizeConfig.height(fraction: 0.26),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.height(fraction: 0.04),
        ),
        itemCount: HomeUserViewModel.topCrafters.length,
        itemBuilder: (BuildContext context, int index) {
          var crafter = crafters[index];
          return CrafterItem(crafter: crafter);
        },
      ),
    );
  }
}
