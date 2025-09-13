import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/utils/size_config.dart';
import '../../../../viewmodels/home_user_view_model.dart';
import 'crafter_item.dart';

class TopCraftersListViewBuilder extends StatelessWidget {
  const TopCraftersListViewBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    final crafters = context.watch<HomeUserViewModel>().topCrafters;
    SizeConfig.init(context);
    return SizedBox(
      height: SizeConfig.height(fraction: 0.3),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.height(fraction: 0.012),
        ),
        itemCount: crafters.length,
        itemBuilder: (BuildContext context, int index) {
          var crafter = crafters[index];
          return CrafterItem(crafter: crafter);
        },
      ),
    );
  }
}
