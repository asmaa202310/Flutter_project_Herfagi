import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/utils/size_config.dart';
import '../../../gallery/gallery_view.dart';
import 'custom_image_widget.dart';
import 'no_images_widget.dart';

class CrafterGallerySection extends StatelessWidget {
  final List<String> workImages = const [
    'https://www.jonbaldie.com/the-two-critical-skills-for-mastering-your-craft.jpeg',
    'https://s.hdnux.com/photos/21/15/41/4511810/5/1200x0.jpg',
    'https://ultimatereloader.com/wp-content/uploads/2023/09/A-student-finishing-a-stock-at-Colorado-School-of-Trades-2500-2048x1140.jpg',
    'https://cdn.bmwblog.com/wp-content/uploads/VR-Wheels-BBS-54.jpg',
    'https://www.kemalmfg.com/wp-content/uploads/2023/05/How-Can-You-Fabricate-Metal-Parts.jpg',
  ];

  const CrafterGallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    SizeConfig.init(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localization.galleryTitle,
            style: TextStyle(
              fontSize: SizeConfig.width(fraction: 0.05),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          workImages.isEmpty
              ? const NoWorkImagesWidget()
              : GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: workImages.length > 4 ? 4 : workImages.length,
                  itemBuilder: (context, index) {
                    if (index == 3 && workImages.length > 4) {
                      final remaining = workImages.length - 3;
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => GalleryView(images: workImages),
                            ),
                          );
                        },
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CustomImageWidget(
                              image: workImages[index],
                              allImages: workImages,
                              currentIndex: index,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  '+$remaining',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return CustomImageWidget(
                      image: workImages[index],
                      allImages: workImages,
                      currentIndex: index,
                    );
                  },
                ),
        ],
      ),
    );
  }
}
