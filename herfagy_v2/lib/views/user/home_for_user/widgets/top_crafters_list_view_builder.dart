import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/profile.dart';
import '/utils/size_config.dart';
import 'crafter_item.dart';

class TopCraftersListViewBuilder extends StatelessWidget {
  const TopCraftersListViewBuilder({
    super.key,
    required this.profilesCrafters,
    required this.rating,
  });
  final List<Profile> profilesCrafters;
  final List<int?> rating;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizedBox(
      height: SizeConfig.height(fraction: 0.3),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.height(fraction: 0.012),
        ),
        itemCount: profilesCrafters.length,
        itemBuilder: (BuildContext context, int index) {
          var crafter = profilesCrafters[index];
          var rate = (index < rating.length) ? rating[index] : null;
          return CrafterItem(crafter: crafter, rate: rate);
        },
      ),
    );
  }
}
