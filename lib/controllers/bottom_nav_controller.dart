import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/pages/add_recipe_page.dart';
import 'package:recipe_app/pages/category_page.dart';
import 'package:recipe_app/pages/favorite_page.dart';
import 'package:recipe_app/pages/home_page.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;

  List<Widget> pages = [
    HomePage(),
    const CategoryPage(),
    const FavoritePage(),
    const AddRecipePage(),
  ];

  Widget get currentPage => pages[currentIndex.value];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
