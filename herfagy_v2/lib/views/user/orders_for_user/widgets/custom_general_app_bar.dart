import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/size_config.dart';

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
    SizeConfig.init(context);
    return SliverAppBar(
      pinned: true,
      toolbarHeight: SizeConfig.height(fraction: 0.07),
      foregroundColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(SizeConfig.width(fraction: 0.07)),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(SizeConfig.width(fraction: 0.07)),
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.width(fraction: 0.065),
          color: Colors.white,
        ),
      ),
      centerTitle: true,
    );
  }
}
