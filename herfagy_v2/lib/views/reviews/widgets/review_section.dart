import 'package:flutter/material.dart';

import '../../../models/old/review_model.dart';
import 'no_reviews_widget.dart';
import 'review_tile.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  final List<ReviewModel> reviews = const [
    ReviewModel(
      userName: 'Noura Hassan',
      userImageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
      rating: 5,
      date: 'September 10, 2025',
      comment:
          'Excellent craftsmanship and very professional. The product was even better than I expected. Highly recommended!',
    ),
    ReviewModel(
      userName: 'Ahmed Mahmoud',
      userImageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
      rating: 4.5,
      date: 'September 5, 2025',
      comment:
          'Great work and good communication. There was a slight delay in delivery, but the quality of the work made up for it.',
    ),
    ReviewModel(
      userName: 'Fatima Elsayed',
      userImageUrl: 'https://randomuser.me/api/portraits/women/17.jpg',
      rating: 3,
      date: 'August 28, 2025',
      comment:
          'The product is okay, but the colors were a bit different from the pictures shown in the gallery.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          reviews.isEmpty
              ? const NoReviewsWidget()
              : ListView.separated(
                  itemCount: reviews.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ReviewTile(review: reviews[index]);
                  },
                  separatorBuilder: (context, index) =>
                      const Divider(thickness: 0.7, height: 10),
                ),
        ],
      ),
    );
  }
}
