import 'package:flutter/material.dart';

class HomeUserView extends StatelessWidget {
  const HomeUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const HomeUserViewBody());
  }
}

class HomeUserViewBody extends StatelessWidget {
  const HomeUserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.blue,
          pinned: true,
          // floating: true,
          expandedHeight: screenHeight * 0.18,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(26)),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: AppBarBackgroundContent(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.09),
            child: CustomSearchBar(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.05,
        top: 0,
        right: screenWidth * 0.05,
        bottom: screenHeight * 0.015,
      ),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(14),
        child: TextField(
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          decoration: InputDecoration(
            hintText: "ابحث عن خدمة أو حرفي...",
            prefixIcon: const Icon(Icons.search, color: Colors.blue),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 8,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarBackgroundContent extends StatelessWidget {
  const AppBarBackgroundContent({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.only(
        left: screenWidth * 0.05,
        top: screenHeight * 0.07,
        right: screenWidth * 0.05,
        bottom: screenHeight * 0.02,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(26)),
      ),
      child: ProfileListTileWidget(),
    );
  }
}

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
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 26,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 26,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
