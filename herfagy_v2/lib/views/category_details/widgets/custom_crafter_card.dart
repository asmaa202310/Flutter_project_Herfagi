import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/views/book_now/book_now_view.dart';
import 'package:herfagy_v2/views/user/home_for_user/widgets/custom_rating_bar_indicator.dart';
import '../../../utils/size_config.dart';
import '../../onboarding/widgets/custom_elevated_button.dart';

class CustomCrafterCard extends StatelessWidget {
  const CustomCrafterCard({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Card(
      shadowColor: Colors.grey.shade300,
      child: ListTile(
        leading: CircleAvatar(
          // backgroundImage: NetworkImage('')
        ),
        title: Text("crafter name"),
        subtitle: CustomRatingBarIndicator(rating: 11),
        trailing: CustomElevatedButton(
          height: SizeConfig.height(fraction: 0.05),
          width: SizeConfig.width(fraction: 0.23),
          text: context.localization.bookNow,
          borderRaduis: SizeConfig.width(fraction: 0.05),
          fontSize: SizeConfig.width(fraction: 0.035),
          padding: 0,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BookNowView()),
          ),
        ),
      ),
    );
  }
}
