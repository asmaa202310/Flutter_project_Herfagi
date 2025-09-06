import 'package:flutter/material.dart';
import 'widgets/home_user_view_body.dart';

class HomeUserView extends StatefulWidget {
  const HomeUserView({super.key});

  @override
  State<HomeUserView> createState() => _HomeUserViewState();
}

class _HomeUserViewState extends State<HomeUserView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeUserViewBody(),
    Center(child: Text("الحجوزات", style: TextStyle(fontSize: 22))),
    Center(child: Text("الملف الشخصي", style: TextStyle(fontSize: 22))),
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
