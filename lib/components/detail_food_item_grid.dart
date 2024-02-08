import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/components/favorite_icon_widget.dart';
import 'package:recipe_app/controllers/food_controller.dart';
import 'package:recipe_app/models/food_item.dart';

class DetailFoodItemGrid extends StatelessWidget {
  final FoodController foodController = Get.find<FoodController>();

  DetailFoodItemGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        return GridView.builder(
          padding: const EdgeInsets.only(bottom: 16),
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
            return _buildDetailFoodItemCard(filteredFoodItem);
          },
        );
      }),
    );
  }

  Widget _buildDetailFoodItemCard(FoodItem foodItem) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 5),
                blurRadius: 2.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // cover image
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                    image: foodItem.coverImage?.isNotEmpty == true
                        ? AssetImage(foodItem.coverImage!)
                        : const AssetImage('assets/images/placeholder.png'),
                  ),
                ),

                const SizedBox(height: 4),

                // title
                Text(
                  foodItem.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                // row of calories & time
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // calories icon
                    const Image(
                      image: AssetImage('assets/images/calories.png'),
                      height: 12,
                    ),
                    const SizedBox(width: 2),
                    // calorie
                    Text(
                      foodItem.calorie,
                      style: const TextStyle(
                        fontSize: 9,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.circle,
                      size: 4,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    // clock icon
                    const Icon(
                      Icons.timer_outlined,
                      size: 13,
                      color: Colors.grey,
                    ),
                    // time
                    Text(
                      foodItem.time ?? '',
                      style: const TextStyle(fontSize: 9, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Obx(() {
              bool isFavorite =
                  foodController.favoriteFoodItemsList.contains(foodItem);

              return FavoriteIconWidget(
                onTapFavoriteIcon: () {
                  if (isFavorite) {
                    foodController.removeFavoriteFoodItem(foodItem);
                  } else {
                    foodController.addFavoriteFoodItem(foodItem);
                  }
                },
                isFavorite: isFavorite,
              );
            }),
          ),
        )
      ],
    );
  }
}



// child: FavoriteIconWidget(
//               onTapFavoriteIcon: () {
//                 if (isFavorite.value) {
//                   isFavorite.value = false;
//                   foodController.removeFavoriteFoodItem(foodItem);
//                 } else {
//                   isFavorite.value = true;
//                   foodController.addFavoriteFoodItem(foodItem);
//                 }
//               },
//               isFavorite: isFavorite.value,
//             ),