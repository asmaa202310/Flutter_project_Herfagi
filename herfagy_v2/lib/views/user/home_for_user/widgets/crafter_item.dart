import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/get_localize_title.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/views/book_now/book_now_view.dart';
import '../../../../constants/app_colors.dart';
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
      margin: EdgeInsets.only(
        left: SizeConfig.width(fraction: 0.01),
        right: SizeConfig.width(fraction: 0.01),
        bottom: SizeConfig.height(fraction: 0.05),
      ),
      padding: EdgeInsets.all(SizeConfig.width(fraction: 0.04)),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.kAppBarHome2Dark
            : AppColors.kButtonsForegroundColorLight,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.kAppBarHome1Dark
                : Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: SizeConfig.width(fraction: 0.06),
            backgroundColor: crafter.color.withValues(alpha: 0.15),
            child: Icon(
              crafter.icon,
              size: SizeConfig.width(fraction: 0.074),
              color: crafter.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            GetLocalizeTitle.getLocalizedTitle(context, crafter.service),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.width(fraction: 0.046),
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.kButtonsForegroundColorLight
                  : AppColors.kPrimaryColorLight.shade800,
            ),
          ),
          Text(
            crafter.name,
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.kButtonsForegroundColorLight.withValues(
                      alpha: 0.7,
                    )
                  : Colors.grey.shade600,
              fontSize: SizeConfig.width(fraction: 0.04),
            ),
          ),
          CustomRatingBarIndicator(rating: crafter.rating),
          const Spacer(),
          CustomElevatedButton(
            text: context.localization.bookNow,
            height: SizeConfig.height(fraction: 0.05),
            fontSize: SizeConfig.width(fraction: 0.04),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookNowView()),
              );
            },
          ),
        ],
      ),
    );
  }
}
