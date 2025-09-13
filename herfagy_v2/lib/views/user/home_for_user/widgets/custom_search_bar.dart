import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/size_config.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.width(fraction: 0.05),
        top: 10,
        right: SizeConfig.width(fraction: 0.05),
        bottom: SizeConfig.height(fraction: 0.015),
      ),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(14),
        child: TextField(
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 13),
            prefixIcon: const Icon(Icons.search, color: Colors.blue),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 8,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
