import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'custom_order_button.dart';

class CrafterItem extends StatelessWidget {
  const CrafterItem({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.crafter,
  });

  final double screenWidth;
  final double screenHeight;
  final dynamic crafter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.45,
      height: screenHeight * 0.25,
      margin: EdgeInsets.only(
        left: screenWidth * 0.04,
        bottom: screenWidth * 0.04,
      ),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: crafter.color.withOpacity(0.15),
            child: Icon(crafter.icon, size: 24, color: crafter.color),
          ),
          const SizedBox(height: 8),
          Text(
            crafter.service,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.blue.shade800,
            ),
          ),
          Text(
            crafter.name,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
          ),
          RatingBarIndicator(
            rating: crafter.rating,
            itemBuilder: (context, _) =>
                const Icon(Icons.star, color: Colors.amber),
            itemCount: 5,
            itemSize: 20,
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomDetailsButton(
              borderRaduis: 12,
              text: 'احجز الآن',
              fontSize: 15,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
