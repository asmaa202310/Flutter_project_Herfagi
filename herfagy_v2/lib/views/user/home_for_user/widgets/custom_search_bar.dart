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
        right: SizeConfig.width(fraction: 0.05),
        bottom: SizeConfig.height(fraction: 0.015),
      ),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(SizeConfig.width(fraction: 0.04)),
        child: TextField(
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: SizeConfig.width(fraction: 0.04)),
            prefixIcon: const Icon(Icons.search, color: Colors.blue),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                SizeConfig.width(fraction: 0.04),
              ),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
