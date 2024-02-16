import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/food_controller.dart';
import 'package:recipe_app/models/food_item.dart';

class FoodItemListView extends StatelessWidget {
  const FoodItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    final FoodController foodController = Get.find<FoodController>();
    return Expanded(
      child: Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 20),
          itemExtent: 100,
          itemCount: foodController.filteredFoodItemsList.length,
          itemBuilder: (BuildContext context, int index) {
            FoodItem foodItem = foodController.filteredFoodItemsList[index];
            return Card(
              elevation: 5,
              surfaceTintColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    // Cover image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        width: 80, // Adjust the width as needed
                        height: 80, // Adjust the height as needed
                        child: Image(
                          fit: BoxFit.cover,
                          image: foodItem.coverImage?.isNotEmpty == true
                              ? AssetImage(foodItem.coverImage!)
                              : const AssetImage(
                                  'assets/images/placeholder.png'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Food title
                          Text(
                            foodItem.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // const Spacer(),
                          // Row calorie and time
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Calories icon
                              const Image(
                                image: AssetImage('assets/images/calories.png'),
                                height: 12,
                              ),
                              const SizedBox(width: 3),
                              // Calorie
                              Text(
                                foodItem.calorie,
                                style: const TextStyle(
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.circle,
                                size: 4,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 5),
                              // Clock icon
                              const Icon(
                                Icons.timer_outlined,
                                size: 13,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 3),
                              // Time
                              Text(
                                foodItem.time ?? '',
                                style: const TextStyle(
                                    fontSize: 9, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    // favorite icon
                    Obx(() {
                      bool isFavorite = foodController.favoriteFoodItemsList
                          .contains(foodItem);
                      return GestureDetector(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color:
                                isFavorite ? Colors.red : Colors.grey.shade600,
                            size: 23,
                          ),
                        ),
                        onTap: () {
                          if (isFavorite) {
                            foodController.removeFavoriteFoodItem(foodItem);
                          } else {
                            foodController.addFavoriteFoodItem(foodItem);
                          }
                        },
                      );
                    }),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
