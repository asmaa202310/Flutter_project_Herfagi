import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/profile.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';

import 'package:herfagy_v2/views/book_now/book_now_view.dart';
import 'package:herfagy_v2/views/user/home_for_user/widgets/custom_rating_bar_indicator.dart';
import '../../../../constants/app_colors.dart';
import '../../../../models/old/service_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/rating_operation_view_model.dart';
import 'package:herfagy_v2/views/book_now/book_now_view.dart';
import 'package:herfagy_v2/views/user/home_for_user/widgets/custom_rating_bar_indicator.dart';
import 'package:herfagy_v2/models/service.dart';
import 'package:provider/provider.dart';
import '../../../../utils/get_localize_title.dart';
import '../../../../utils/size_config.dart';
import '../../../onboarding/widgets/custom_elevated_button.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    super.key,
    required this.service,
    required this.profilesCrafter,
    required this.profilesUsers,
  });

  final Service service;
  final Profile profilesCrafter;
  final List<Profile> profilesUsers;

  static final List<Color> _colors = [
    Colors.blue,
    Colors.lightBlueAccent,
    Colors.indigo,
    Colors.blueGrey,
    Colors.cyan,
  ];

  static final Map<String, IconData> _iconsMap = {
    "airConditioning": Icons.ac_unit,
    "painter": Icons.format_paint,
    "plumber": Icons.water_damage,
    "electrician": Icons.flash_on,
    "carpenter": Icons.handyman,
    "cleaning": Icons.cleaning_services,
    "gardener": Icons.park,
    "mechanic": Icons.build,
    "teacher": Icons.school,
    "doctor": Icons.local_hospital,
  };

  static final Map<String, ServiceKey> _serviceKeyMap = {
    "electrician": ServiceKey.electrician,
    "carpenter": ServiceKey.carpenter,
    "plumber": ServiceKey.plumber,
    "painter": ServiceKey.painter,
    "blacksmith": ServiceKey.blacksmith,
    "airConditioning": ServiceKey.airConditioning,
  };

  IconData _getIconData(String iconName) {
    return _iconsMap[iconName] ?? Icons.category;
  }

  Future<double> _calculateAverageRating(
    BuildContext context,
    List<Profile> profilesUsers,
    Profile profilesCrafter,
  ) async {
    final ratingVM = Provider.of<RatingOperationViewModel>(
      context,
      listen: false,
    );
    double sumRating = 0;
    int count = 0;

    for (var profile in profilesUsers) {
      final rate = await ratingVM.getRatingByCustomerAndCrafter(
        profile.id,
        profilesCrafter.id,
      );

      if (rate != null && rate > 0) {
        sumRating += rate;
        count++;
      }
    }

    return count > 0 ? sumRating / count : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final color = _colors[service.id % _colors.length];

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
      child: Row(
        children: [
          CircleAvatar(
            radius: SizeConfig.width(fraction: 0.07),
            backgroundColor: color.withValues(alpha: 0.15),
            child: Icon(
              _getIconData(service.name),
              size: SizeConfig.width(fraction: 0.07),
              color: color,
            ),
          ),

          SizedBox(width: SizeConfig.width(fraction: 0.04)),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                GetLocalizeTitle.getLocalizedTitle(
                  context,
                  _serviceKeyMap[service.name] ?? ServiceKey.electrician,
                ),
                style: TextStyle(
                  fontSize: SizeConfig.width(fraction: 0.048),
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.kButtonsForegroundColorLight
                      : AppColors.kPrimaryColorLight.shade800,
                ),
              ),
              Text(
                profilesCrafter.username,
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.kButtonsForegroundColorLight.withValues(
                          alpha: 0.7,
                        )
                      : Colors.grey.shade600,
                  fontSize: SizeConfig.width(fraction: 0.038),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig.height(fraction: 0.005)),
              FutureBuilder<double>(
                future: _calculateAverageRating(
                  context,
                  profilesUsers,
                  profilesCrafter,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  }
                  if (snapshot.hasError) {
                    return Text("Error", style: TextStyle(color: Colors.red));
                  }
                  final averageRating = snapshot.data ?? 0.0;
                  return CustomRatingBarIndicator(
                    rating: averageRating,
                    itemSize: SizeConfig.width(fraction: 0.05),
                  );
                },
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

           
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookNowView(crafter: profilesCrafter),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
