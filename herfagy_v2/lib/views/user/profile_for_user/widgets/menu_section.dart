import 'package:flutter/material.dart';
import 'menu_item.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      (Icons.help_outline, 'المساعدة والدعم', Colors.teal),
      (Icons.security, 'الخصوصية والأمان', Colors.indigo),
      (Icons.language, 'اللغة', Colors.brown),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'حسابي',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 15),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return MenuItem(icon: item.$1, title: item.$2, color: item.$3);
          },
        ),
      ],
    );
  }
}
