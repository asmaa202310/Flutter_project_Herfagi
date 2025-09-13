import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import '../../user/orders_for_user/widgets/custom_general_app_bar.dart';
import 'review_section.dart';

class CrafterReviewsViewBody extends StatelessWidget {
  const CrafterReviewsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    return CustomScrollView(
      slivers: [
        CustomGeneralSliverAppBar(
          text: localization.reviewsAndRatings,
          automaticallyImplyLeading: true,
        ),
        const ReviewsSection(),
      ],
    );
  }
}
