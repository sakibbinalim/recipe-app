import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/components/detail_food_item_grid.dart';
import 'package:recipe_app/components/food_item_grid.dart';
import 'package:recipe_app/components/search_text_field.dart';
import 'package:recipe_app/controllers/food_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FoodController foodController = Get.find<FoodController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xE5D9D9D9),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What is in your Kitchen?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                'Enter some ingredients',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              SearchTextField(
                onSearch: (query) => foodController.searchFoodItems(query),
              ),
              const SizedBox(height: 20),
              DetailFoodItemGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
