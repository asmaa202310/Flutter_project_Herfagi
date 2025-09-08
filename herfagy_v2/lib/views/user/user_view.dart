import 'package:flutter/material.dart';
import 'package:herfagy_v2/views/user/orders_for_user/orders_view.dart';
import 'home_for_user/home_user_view.dart';
import 'profile_for_user/user_profile_view.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeUserView(),
    const OrdersView(),
    UserProfilePage(),
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
