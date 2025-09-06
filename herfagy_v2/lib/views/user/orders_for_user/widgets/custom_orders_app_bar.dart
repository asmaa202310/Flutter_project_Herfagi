import 'package:flutter/material.dart';

class CustomOrdersAppBar extends StatelessWidget {
  const CustomOrdersAppBar({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 6,
      expandedHeight: 60,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        background: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadiusGeometry.vertical(
              bottom: Radius.circular(25),
            ),
            gradient: LinearGradient(
              colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
