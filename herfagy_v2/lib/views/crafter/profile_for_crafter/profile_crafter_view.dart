import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:herfagy_v2/views/user/profile_for_user/widgets/profile_header.dart';
import '../../../viewmodels/profile_crafter_view_model.dart';
import '../../user/orders_for_user/widgets/custom_orders_app_bar.dart';
import '../../user/profile_for_user/widgets/menu_section.dart';
import '../../user/profile_for_user/widgets/settings_section.dart';

class ProfileCrafterView extends StatelessWidget {
  const ProfileCrafterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ProfileCrafterViewBody());
  }
}

class ProfileCrafterViewBody extends StatelessWidget {
  const ProfileCrafterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screemWidth = MediaQuery.sizeOf(context).width;
    // final screemHeight = MediaQuery.sizeOf(context).height;

    return CustomScrollView(
      slivers: [
        const CustomGeneralSliverAppBar(text: "حسابي"),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: screemWidth * 0.05),
          sliver: SliverList.list(
            children: [
              const SizedBox(height: 20),
              ProfileHeader(
                userName: 'محمد علي',
                location: 'القاهرة، مصر',
                screenWidth: screemWidth,
              ),
              MenuSection(items: ProfileCrafterViewModel.menuItems(context)),
              const CrafterGallerySection(),
              const SizedBox(height: 30),
              SettingsSection(
                notificationsEnabled: true,
                darkModeEnabled: true,
                onNotificationsChanged: (_) {},
                onDarkModeChanged: (_) {},
                onLogout: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CrafterGallerySection extends StatelessWidget {
  final List<String> workImages = const [
    'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA5L3Jhd3BpeGVsX29mZmljZV8yOF9mZW1hbGVfbWluaW1hbF9yb2JvdF9mYWNlX29uX2RhcmtfYmFja2dyb3VuZF81ZDM3YjhlNy04MjRkLTQ0NWUtYjZjYy1hZmJkMDI3ZTE1NmYucG5n.png',
    'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA5L3Jhd3BpeGVsX29mZmljZV8yOF9mZW1hbGVfbWluaW1hbF9yb2JvdF9mYWNlX29uX2RhcmtfYmFja2dyb3VuZF81ZDM3YjhlNy04MjRkLTQ0NWUtYjZjYy1hZmJkMDI3ZTE1NmYucG5n.png',
    'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA5L3Jhd3BpeGVsX29mZmljZV8yOF9mZW1hbGVfbWluaW1hbF9yb2JvdF9mYWNlX29uX2RhcmtfYmFja2dyb3VuZF81ZDM3YjhlNy04MjRkLTQ0NWUtYjZjYy1hZmJkMDI3ZTE1NmYucG5n.png',
    'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA5L3Jhd3BpeGVsX29mZmljZV8yOF9mZW1hbGVfbWluaW1hbF9yb2JvdF9mYWNlX29uX2RhcmtfYmFja2dyb3VuZF81ZDM3YjhlNy04MjRkLTQ0NWUtYjZjYy1hZmJkMDI3ZTE1NmYucG5n.png',
    'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA5L3Jhd3BpeGVsX29mZmljZV8yOF9mZW1hbGVfbWluaW1hbF9yb2JvdF9mYWNlX29uX2RhcmtfYmFja2dyb3VuZF81ZDM3YjhlNy04MjRkLTQ0NWUtYjZjYy1hZmJkMDI3ZTE1NmYucG5n.png',
    'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA5L3Jhd3BpeGVsX29mZmljZV8yOF9mZW1hbGVfbWluaW1hbF9yb2JvdF9mYWNlX29uX2RhcmtfYmFja2dyb3VuZF81ZDM3YjhlNy04MjRkLTQ0NWUtYjZjYy1hZmJkMDI3ZTE1NmYucG5n.png',
  ];

  const CrafterGallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text(
            'معرض الأعمال',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          workImages.isEmpty
              ? NoWorkImagesWidget()
              : GridView.builder(
                  padding: EdgeInsets.all(10),
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
                              builder: (_) =>
                                  FullGalleryPage(images: workImages),
                            ),
                          );
                        },
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CustomImageWidget(image: workImages[index]),
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

                    return CustomImageWidget(image: workImages[index]);
                  },
                ),
        ],
      ),
    );
  }
}

class NoWorkImagesWidget extends StatelessWidget {
  const NoWorkImagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            'لا يوجد أعمال مضافة حتى الآن',
            style: TextStyle(fontSize: 16),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'اضف صور الآن',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FullGalleryPage extends StatelessWidget {
  final List<String> images;

  const FullGalleryPage({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('جميع الأعمال')),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return CustomImageWidget(image: images[index]);
        },
      ),
    );
  }
}

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Colors.grey[300],
          child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
        ),
        errorWidget: (context, url, error) =>
            const Icon(Icons.broken_image, color: Colors.grey),
      ),
    );
  }
}
