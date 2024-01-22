import 'package:get/get.dart';
import 'package:recipe_app/models/food_item.dart';

class FoodController extends GetxController {
  final RxList<FoodItem> _foodItemsList = <FoodItem>[
    FoodItem(
      title: 'Chorizo & mozzarella gnocchi bake',
      category: 'Vegetarian',
      calorie: '300 kcal',
      time: '30 mins',
      coverImage: 'assets/images/chorizo.png',
      description: 'A delicious sample food item.',
      ingredients: ['Ingredient 1', 'Ingredient 2', 'Ingredient 3'],
    ),
    FoodItem(
      title: 'Chorizo & mozzarella gnocchi bake',
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

  final RxList<FoodItem> _filteredFoodItemsList = <FoodItem>[].obs;

  RxList<FoodItem> get foodItemsList => _foodItemsList;
  RxList<FoodItem> get filteredFoodItemsList => _filteredFoodItemsList;

  @override
  void onInit() {
    super.onInit();
    _filteredFoodItemsList.assignAll(_foodItemsList);
  }

  void addFoodItem(FoodItem foodItem) {
    _foodItemsList.add(foodItem);
  }

  void searchFoodItems(String query) {
    if (query.isEmpty) {
      _filteredFoodItemsList.assignAll(_foodItemsList);
    } else {
      _filteredFoodItemsList.assignAll(_foodItemsList
          .where((foodItem) =>
              foodItem.title.toLowerCase().contains(query.toLowerCase()) ||
              foodItem.ingredients.any((ingredient) =>
                  ingredient.toLowerCase().contains(query.toLowerCase())))
          .toList());
    }
  }
}