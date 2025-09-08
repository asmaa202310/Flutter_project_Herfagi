import 'package:flutter/material.dart';
import 'package:herfagy_v2/views/user/orders_for_user/widgets/custom_orders_app_bar.dart';

import 'widgets/menu_section.dart';
import 'widgets/profile_header.dart';
import 'widgets/settings_section.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  final bool notificationsEnabled = true;
  final bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomOrdersAppBar(text: 'حسابي'),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList.list(
              children: [
                ProfileHeader(userName: 'محمد علي', location: 'القاهرة، مصر'),
                const SizedBox(height: 30),
                const MenuSection(),
                const SizedBox(height: 30),
                SettingsSection(
                  notificationsEnabled: notificationsEnabled,
                  darkModeEnabled: darkModeEnabled,
                  onNotificationsChanged: (_) {},
                  onDarkModeChanged: (_) {},
                  onLogout: () => _showLogoutDialog(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text(
          'تسجيل الخروج',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text('هل أنت متأكد من أنك تريد تسجيل الخروج من حسابك؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('تم تسجيل الخروج بنجاح')),
                );
            },
            child: const Text('تأكيد', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
