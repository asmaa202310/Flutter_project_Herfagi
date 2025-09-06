import 'package:flutter/material.dart';

class ProfileListTileWidget extends StatelessWidget {
  const ProfileListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: Icon(Icons.person, color: Colors.blue),
      ),
      title: const Text(
        "مرحباً أحمد 👋",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      subtitle: const Text(
        "كيف يمكننا مساعدتك اليوم؟",
        style: TextStyle(color: Colors.white70, fontSize: 13),
      ),
      trailing: Stack(
        children: [
          Icon(Icons.notifications_none, color: Colors.white, size: 33),
          CircleAvatar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            radius: 10,
            child: Text('1', style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
