import 'package:get/get.dart';
import 'package:recipe_app/models/food_item.dart';

class FoodController extends GetxController {
  final RxList<FoodItem> _foodItems = <FoodItem>[
    FoodItem(
      title: 'Sample Food 1',
      category: 'Vegetarian',
      calorie: '300 kcal',
      time: '30 mins',
      coverImage: 'assets/images/chorizo.png',
      description: 'A delicious sample food item.',
      ingredients: ['Ingredient 1', 'Ingredient 2', 'Ingredient 3'],
    ),
    FoodItem(
      title: 'Sample Food 2',
      category: 'Non-Vegetarian',
      calorie: '500 kcal',
      time: '45 mins',
      coverImage: 'assets/images/chorizo.png',
      description: 'Another tasty sample food item.',
      ingredients: ['Ingredient A', 'Ingredient B', 'Ingredient C'],
    ),
    FoodItem(
      title: 'Sample Food 1',
      category: 'Vegetarian',
      calorie: '300 kcal',
      time: '30 mins',
      coverImage: 'assets/images/chorizo.png',
      description: 'A delicious sample food item.',
      ingredients: ['Ingredient 1', 'Ingredient 2', 'Ingredient 3'],
    ),
    FoodItem(
      title: 'Sample Food 2',
      category: 'Non-Vegetarian',
      calorie: '500 kcal',
      time: '45 mins',
      coverImage: 'assets/images/chorizo.png',
      description: 'Another tasty sample food item.',
      ingredients: ['Ingredient A', 'Ingredient B', 'Ingredient C'],
    ),
  ].obs;

  RxList<FoodItem> get foodItems => _foodItems;

  void addFoodItem(FoodItem foodItem) {
    _foodItems.add(foodItem);
  }
}
