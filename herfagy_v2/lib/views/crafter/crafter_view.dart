import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import '../../constants/app_colors.dart';
import 'home_for_crafter/home_crafter_view.dart';
import 'orders_for_crafter/crafter_orders_view.dart';
import 'profile_for_crafter/crafter_profile_view.dart';

class CrafterView extends StatefulWidget {
  const CrafterView({super.key});

  @override
  State<CrafterView> createState() => _CrafterViewState();
}

class _CrafterViewState extends State<CrafterView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeCrafterView(),
    const CrafterOrdersView(),
    const CrafterProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        backgroundColor: isDark
            ? AppColors.kAppBarHome1Dark
            : AppColors.kButtonsForegroundColorLight,
        // indicatorColor: Colors.blue.shade300,
        // backgroundColor: isDark
        //     ? AppColors.kButtonsForegroundColorLight
        //     : ,
        indicatorColor: isDark
            ? AppColors.kButtonsForegroundColorLight.withValues(alpha: 0.3)
            : Colors.blue.shade300,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home),
            label: localization.home,
          ),
          NavigationDestination(
            icon: const Icon(Icons.calendar_today),
            label: localization.orders,
          ),
          NavigationDestination(
            icon: const Icon(Icons.person),
            label: localization.profile,
          ),
        ],
      ),
    );
  }
}
