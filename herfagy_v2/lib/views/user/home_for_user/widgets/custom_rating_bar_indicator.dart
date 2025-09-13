import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../utils/size_config.dart';

class CustomRatingBarIndicator extends StatelessWidget {
  const CustomRatingBarIndicator({
    super.key,
    required this.rating,
    this.itemSize,
  });

  final double rating;
  final double? itemSize;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
      itemCount: 5,
      itemSize: itemSize ?? SizeConfig.width(fraction: 0.046),
    );
  }
}
