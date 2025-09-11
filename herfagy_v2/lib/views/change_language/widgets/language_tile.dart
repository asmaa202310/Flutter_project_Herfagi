import 'package:flutter/material.dart';

class LanguageTile extends StatelessWidget {
  final String title;
  final Locale locale;
  final bool selected;
  final VoidCallback onTap;
  final TextStyle? titleStyle;

  const LanguageTile({
    super.key,
    required this.title,
    required this.locale,
    required this.selected,
    required this.onTap,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.language, color: Colors.blue, size: 30),
      title: Text(
        title,
        style:
            titleStyle ??
            const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      trailing: selected ? const Icon(Icons.check, color: Colors.green) : null,
      onTap: onTap,
    );
  }
}
