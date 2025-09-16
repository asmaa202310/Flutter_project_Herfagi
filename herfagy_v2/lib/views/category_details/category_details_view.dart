import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/service.dart';
import 'widgets/category_details_view_body.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key, required this.category});
  final Service category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CategoryDetailsViewBody(category: category));
  }
}
