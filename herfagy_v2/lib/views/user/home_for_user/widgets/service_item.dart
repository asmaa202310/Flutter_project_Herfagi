import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/views/user/home_for_user/widgets/custom_rating_bar_indicator.dart';
import '../../../../models/old/service_model.dart';
import '../../../../utils/get_localize_title.dart';
import '../../../../utils/size_config.dart';
import '../../../onboarding/widgets/custom_elevated_button.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key, required this.service});

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.width(fraction: 0.05),
        vertical: SizeConfig.height(fraction: 0.01),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width(fraction: 0.04),
        vertical: SizeConfig.width(fraction: 0.03),
      ),
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
      child: Row(
        children: [
          CircleAvatar(
            radius: SizeConfig.width(fraction: 0.07),
            backgroundColor: service.color.withValues(alpha: 0.15),
            child: Icon(
              service.icon,
              size: SizeConfig.width(fraction: 0.07),
              color: service.color,
            ),
          ),
          SizedBox(width: SizeConfig.width(fraction: 0.04)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                GetLocalizeTitle.getLocalizedTitle(context, service.service),
                style: TextStyle(
                  fontSize: SizeConfig.width(fraction: 0.048),
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
              Text(
                service.name,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: SizeConfig.width(fraction: 0.038),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig.height(fraction: 0.005)),
              CustomRatingBarIndicator(
                rating: service.rating,
                itemSize: SizeConfig.width(fraction: 0.05),
              ),
            ],
          ),
          const Spacer(),
          CustomElevatedButton(
            height: SizeConfig.height(fraction: 0.05),
            width: SizeConfig.width(fraction: 0.23),
            text: context.localization.bookNow,
            borderRaduis: SizeConfig.width(fraction: 0.05),
            fontSize: SizeConfig.width(fraction: 0.035),
            padding: 0,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
