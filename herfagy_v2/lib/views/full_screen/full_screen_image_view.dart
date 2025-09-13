import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullScreenImageView extends StatelessWidget {
  final List<String> images;
  final int initialIndex;

  const FullScreenImageView({
    super.key,
    required this.images,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withValues(alpha: 0.8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: PhotoViewGallery.builder(
        itemCount: images.length,
        pageController: PageController(initialPage: initialIndex),
        builder: (context, index) {
          final img = images[index];
          return PhotoViewGalleryPageOptions(
            imageProvider: CachedNetworkImageProvider(img),
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 3.0,
            heroAttributes: index == initialIndex
                ? PhotoViewHeroAttributes(tag: img)
                : null,
          );
        },
        loadingBuilder: (context, event) => const Center(
          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
        ),

        backgroundDecoration: const BoxDecoration(color: Colors.transparent),
      ),
    );
  }
}
