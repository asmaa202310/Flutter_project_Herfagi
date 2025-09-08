import 'package:flutter/material.dart';

import 'switch_item.dart';

class SettingsSection extends StatelessWidget {
  final bool notificationsEnabled;
  final bool darkModeEnabled;
  final Function(bool) onNotificationsChanged;
  final Function(bool) onDarkModeChanged;
  final VoidCallback onLogout;

  const SettingsSection({
    super.key,
    required this.notificationsEnabled,
    required this.darkModeEnabled,
    required this.onNotificationsChanged,
    required this.onDarkModeChanged,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'الإعدادات العامة',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 15),
        SwitchItem(
          icon: Icons.dark_mode,
          title: 'الوضع المظلم',
          value: darkModeEnabled,
          onChanged: onDarkModeChanged,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: onLogout,
            icon: const Icon(Icons.logout, color: Colors.white),
            label: const Text(
              'تسجيل الخروج',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
