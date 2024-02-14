import 'package:flutter/material.dart';
import 'package:recipe_app/components/category_widget.dart';

class CategoryPage extends StatelessWidget {
  final Map<String, String> categoryItems = {
    'Breakfast': 'assets/icons/breakfast.png',
    'Lunch': 'assets/icons/lunch.png',
    'Dinner': 'assets/icons/dinner.png',
    'Drinks': 'assets/icons/drink.png',
    'Soups': 'assets/icons/soup.png',
    'Desserts': 'assets/icons/dessert.png',
    'Snacks': 'assets/icons/snack.png',
  };
  CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xE5D9D9D9),
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 30)
            .copyWith(top: 30, bottom: 15),
        itemCount: categoryItems.length,
        itemBuilder: (BuildContext context, int index) {
          final categoryTitle = categoryItems.keys.elementAt(index);
          final imagePath = categoryItems.values.elementAt(index);
          return CategoryWidget(
            categoryTitle: categoryTitle,
            imagePath: imagePath,
          );
        },
      ),
    );
  }
}
