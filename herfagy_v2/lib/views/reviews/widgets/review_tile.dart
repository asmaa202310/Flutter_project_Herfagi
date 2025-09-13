import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../models/old/review_model.dart';
import '../../user/home_for_user/widgets/custom_rating_bar_indicator.dart';

class ReviewTile extends StatelessWidget {
  final ReviewModel review;
  const ReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 22,
            backgroundImage: CachedNetworkImageProvider(review.userImageUrl),
          ),
          title: Text(
            review.userName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(
            review.date,
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
          trailing: CustomRatingBarIndicator(rating: review.rating),
        ),
        const SizedBox(height: 8),
        Text(
          review.comment,
          style: TextStyle(color: Colors.grey[800], height: 1.4),
        ),
      ],
    );
  }
}
