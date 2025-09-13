import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:herfagy_v2/utils/get_localize_title.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import '../../../onboarding/widgets/custom_elevated_button.dart';
import '/models/old/crafter_model.dart';

import '../../../../utils/size_config.dart';
import 'custom_rating_bar_indicator.dart';

class CrafterItem extends StatelessWidget {
  const CrafterItem({super.key, required this.crafter});

  final CrafterModel crafter;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      width: SizeConfig.width(fraction: 0.45),
      height: SizeConfig.height(fraction: 0.26),
      margin: EdgeInsets.only(
        left: SizeConfig.width(fraction: 0.01),
        right: SizeConfig.width(fraction: 0.01),
        bottom: SizeConfig.width(fraction: 0.04),
      ),
      padding: EdgeInsets.all(SizeConfig.width(fraction: 0.04)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: crafter.color.withValues(alpha: 0.15),
            child: Icon(crafter.icon, size: 24, color: crafter.color),
          ),
          const SizedBox(height: 8),
          Text(
            GetLocalizeTitle.getLocalizedTitle(context, crafter.service),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.blue.shade800,
            ),
          ),
          Text(
            crafter.name,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
          ),
          CustomRatingBarIndicator(rating: crafter.rating),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              text: context.localization.bookNow,
              height: 35,
              fontSize: 15,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
