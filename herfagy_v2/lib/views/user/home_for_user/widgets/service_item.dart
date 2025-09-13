import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
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
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: service.color.withValues(alpha: 0.15),
            child: Icon(service.icon, size: 28, color: service.color),
          ),
          SizedBox(width: SizeConfig.width(fraction: 0.04)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                GetLocalizeTitle.getLocalizedTitle(context, service.service),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
              Text(service.name, style: TextStyle(color: Colors.grey.shade600)),
              const SizedBox(height: 4),
              RatingBarIndicator(
                rating: service.rating,
                itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: Colors.amber),
                itemCount: 5,
                itemSize: 18,
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  context.localization.priceWithCurrency(service.price),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 32,
                width: 73,
                child: CustomElevatedButton(
                  text: context.localization.bookNow,
                  borderRaduis: 47,
                  fontSize: 12,
                  padding: 0,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
