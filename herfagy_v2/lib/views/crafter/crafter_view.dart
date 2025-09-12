import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'home_for_herafy/home_crafter_view.dart';
import 'orders_for_crafter/orders_crafter_view.dart';
import 'profile_for_crafter/profile_crafter_view.dart';

class CrafterView extends StatefulWidget {
  const CrafterView({super.key});

  @override
  State<CrafterView> createState() => _CrafterViewState();
}

class _CrafterViewState extends State<CrafterView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeCrafterView(),
    const OrdersCrafterView(),
    const ProfileCrafterView(),
  ];
  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        indicatorColor: Colors.blue.shade300,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home),
            label: localization.home_crafter,
          ),
          NavigationDestination(
            icon: const Icon(Icons.calendar_today),
            label: localization.bookings_crafter,
          ),
          NavigationDestination(
            icon: const Icon(Icons.person),
            label: localization.profile_crafter,
          ),
        ],
      ),
    );
  }
}
