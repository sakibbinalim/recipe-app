import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/components/favorite_icon_widget.dart';
import 'package:recipe_app/controllers/food_controller.dart';
import 'package:recipe_app/models/food_item.dart';

class FoodItemGrid extends StatelessWidget {
  final FoodController foodController = Get.find<FoodController>();

  FoodItemGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 180,
          ),
          itemCount: foodController.filteredFoodItemsList.length,
          itemBuilder: (BuildContext context, int index) {
            FoodItem filteredFoodItem =
                foodController.filteredFoodItemsList[index];
            return _buildFoodItemCard(filteredFoodItem);
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
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FavoriteIconWidget(
              onTapFavoriteIcon: () {
                foodController.addFavoriteFoodItem(foodItem);
              },
            ),
          ),
        ),
      ],
    );
  }
}
