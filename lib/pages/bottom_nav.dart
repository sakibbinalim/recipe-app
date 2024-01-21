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
          selectedItemColor: const Color(0xFF00B3BF),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: const IconThemeData(),
          currentIndex: bottomNavController.currentIndex.value,
          onTap: (index) {
            bottomNavController.changePage(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          ],
        );
      }),
    );
  }
}
