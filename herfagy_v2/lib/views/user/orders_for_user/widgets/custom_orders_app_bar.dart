import 'package:flutter/material.dart';

class CustomGeneralSliverAppBar extends StatelessWidget {
  const CustomGeneralSliverAppBar({
    super.key,
    required this.text,
    this.automaticallyImplyLeading,
  });

  final String text;
  final bool? automaticallyImplyLeading;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      toolbarHeight: 60,
      foregroundColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(26)),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(26)),
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
    );
  }
}
