import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herfagy_v2/models/profile.dart';
import 'package:herfagy_v2/utils/get_localize_title.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/service_operation_view_model.dart';
import 'package:herfagy_v2/views/book_now/book_now_view.dart';
import 'package:provider/provider.dart';
import '../../../onboarding/widgets/custom_elevated_button.dart';

import '../../../../utils/size_config.dart';
import 'custom_rating_bar_indicator.dart';

class CrafterItem extends StatelessWidget {
  const CrafterItem({super.key, required this.crafter, this.rate});

  final Profile crafter;
  final int? rate;

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
    "plumber": Icons.plumbing,
    "electrician": Icons.electrical_services,
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

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return FutureBuilder(
      future: Provider.of<ServiceOperationViewModel>(
        context,
        listen: false,
      ).getServiceById(crafter.serviceId!),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final service = snapshot.data!;
        final color = _colors[crafter.id.hashCode % _colors.length];

        return Container(
          width: SizeConfig.width(fraction: 0.45),
          margin: EdgeInsets.only(
            left: SizeConfig.width(fraction: 0.01),
            right: SizeConfig.width(fraction: 0.01),
            bottom: SizeConfig.height(fraction: 0.05),
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
                radius: SizeConfig.width(fraction: 0.06),
                backgroundColor: color.withValues(alpha: 0.15),
                child: Icon(
                  _getIconData(service.name),
                  size: SizeConfig.width(fraction: 0.074),
                  color: color,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                GetLocalizeTitle.getLocalizedTitle(
                  context,
                  _serviceKeyMap[service.name] ?? ServiceKey.electrician,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.width(fraction: 0.046),
                  color: Colors.blue.shade800,
                ),
              ),
              Text(
                crafter.username,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: SizeConfig.width(fraction: 0.04),
                ),
              ),
              CustomRatingBarIndicator(rating: (rate ?? 0).toDouble()),
              const Spacer(),
              CustomElevatedButton(
                text: context.localization.bookNow,
                height: SizeConfig.height(fraction: 0.05),
                fontSize: SizeConfig.width(fraction: 0.04),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookNowView(crafter: crafter),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
