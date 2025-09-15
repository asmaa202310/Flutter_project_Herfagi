import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/get_localize_title.dart';
import 'package:herfagy_v2/utils/size_config.dart';
import 'package:herfagy_v2/views/category_details/widgets/custom_crafter_card.dart';
import 'package:herfagy_v2/views/user/orders_for_user/widgets/custom_general_app_bar.dart';

class CategoryDetailsViewBody extends StatelessWidget {
  const CategoryDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /// change the service key by the model
        CustomGeneralSliverAppBar(
          text: ServiceKey.painter.name,
          automaticallyImplyLeading: true,
        ),
        SliverPadding(
          padding: EdgeInsetsGeometry.all(SizeConfig.width(fraction: 0.03)),
          sliver: SliverList.builder(
            itemCount: 4,

            /// pass crafter model here
            itemBuilder: (context, index) => CustomCrafterCard(),
          ),
        ),
      ],
    );
  }
}
