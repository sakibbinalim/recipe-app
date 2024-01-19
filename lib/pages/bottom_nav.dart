import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/bottom_nav_controller.dart';
import 'package:recipe_app/pages/add_recipe_page.dart';
import 'package:recipe_app/pages/category_page.dart';
import 'package:recipe_app/pages/favorite_page.dart';
import 'package:recipe_app/pages/home_page.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final BottomNavController _controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return _controller.currentPage;
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xE5D9D9D9),
          selectedItemColor: const Color(0xFF00B3BF),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _controller.currentIndex.value,
          onTap: (index) {
            _controller.changePage(index);
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
