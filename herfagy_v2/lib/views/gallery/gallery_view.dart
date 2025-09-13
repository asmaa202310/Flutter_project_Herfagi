import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import '../../utils/size_config.dart';
import '../crafter/profile_for_crafter/widgets/custom_image_widget.dart';
import '../user/orders_for_user/widgets/custom_general_app_bar.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({super.key, required this.images});

  final List<String> images;
  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    SizeConfig.init(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomGeneralSliverAppBar(
            text: localization.allWorks,
            automaticallyImplyLeading: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                return CustomImageWidget(
                  image: images[index],
                  allImages: images,
                  currentIndex: index,
                );
              }, childCount: images.length),
            ),
          ),
        ],
      ),
    );
  }
}
