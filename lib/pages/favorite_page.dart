import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/food_controller.dart';
import 'package:recipe_app/models/food_item.dart';

class FavoritePage extends StatelessWidget {
  final FoodController _foodController = Get.find<FoodController>();

  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xE5D9D9D9),
      ),
      body: Obx(() {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 180,
          ),
          itemCount: _foodController.favoriteFoodItemsList.length,
          itemBuilder: (BuildContext context, int index) {
            FoodItem favoriteFoodItem =
                _foodController.favoriteFoodItemsList[index];
            return _buildFoodItemCard(favoriteFoodItem);
          },
        );
      }),
    );
  }

  Widget _buildFoodItemCard(FoodItem foodItem) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
              image: foodItem.coverImage?.isNotEmpty == true
                  ? AssetImage(foodItem.coverImage!)
                  : const AssetImage('assets/images/placeholder.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Stack(
              children: [
                Text(
                  foodItem.title,
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1.0
                      ..color = Colors.black,
                  ),
                ),
                Text(
                  foodItem.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
