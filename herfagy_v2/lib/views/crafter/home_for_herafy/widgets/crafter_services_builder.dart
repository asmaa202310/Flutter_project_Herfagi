import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../viewmodels/home_crafter_view_model.dart';
import '../../../user/home_for_user/widgets/category_item.dart';

class CrafterServicesBuilder extends StatelessWidget {
  const CrafterServicesBuilder({super.key, required this.screenWidth});
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return Consumer<CrafterServicesProvider>(
      builder: (context, provider, _) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Wrap(
              spacing: screenWidth * 0.03,
              runSpacing: screenWidth * 0.03,
              children: List.generate(provider.services.length, (index) {
                final service = provider.services[index];
                return GestureDetector(
                  onTap: () {},
                  child: CategoryItem(category: service, marginRight: 0),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
