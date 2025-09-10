import 'package:flutter/material.dart';
import 'package:herfagy_v2/views/crafter/home_for_herafy/home_crafter_view.dart';

class CrafterView extends StatefulWidget {
  const CrafterView({super.key});

  @override
  State<CrafterView> createState() => _CrafterViewState();
}

class _CrafterViewState extends State<CrafterView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeCrafterView(),
    const HomeCrafterView(),
    const HomeCrafterView(),
  ];
  @override
  Widget build(BuildContext context) {
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
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "الرئيسية"),
          NavigationDestination(
            icon: Icon(Icons.calendar_today),
            label: "الحجوزات",
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: "الملف الشخصي",
          ),
        ],
      ),
    );
  }
}
