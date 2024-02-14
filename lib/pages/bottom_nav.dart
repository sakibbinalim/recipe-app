import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/bottom_nav_controller.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final BottomNavController bottomNavController =
      Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return bottomNavController.currentPage;
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xE5D9D9D9),
          selectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: const IconThemeData(),
          currentIndex: bottomNavController.currentIndex.value,
          onTap: (index) {
            bottomNavController.changePage(index);
          },
          items: [
            _buildBottomNavigationBarItem(Icons.home, 'Home', 0),
            _buildBottomNavigationBarItem(Icons.bookmark, 'Category', 1),
            _buildBottomNavigationBarItem(Icons.favorite, 'Favorites', 2),
            _buildBottomNavigationBarItem(Icons.add, 'Add', 3),
          ],
        );
      }),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, String label, int index) {
    bool isSelected = index == bottomNavController.currentIndex.value;
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(15),
        decoration: isSelected
            ? BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF00B4BF).withOpacity(0.3),
              )
            : null,
        child: Icon(icon),
      ),
      label: label,
    );
  }
}
