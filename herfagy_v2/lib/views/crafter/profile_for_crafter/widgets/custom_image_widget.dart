import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../full_screen/full_screen_image_view.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    super.key,
    required this.image,
    required this.allImages,
    required this.currentIndex,
  });

  final String image;
  final List<String> allImages;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            opaque: false,
            pageBuilder: (_, __, ___) => FullScreenImageView(
              images: allImages,
              initialIndex: currentIndex,
            ),
            transitionsBuilder: (_, anim, __, child) {
              return FadeTransition(opacity: anim, child: child);
            },
          ),
        );
      },
      child: Hero(
        tag: image,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Colors.grey[300],
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            errorWidget: (context, url, error) =>
                const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
