import 'package:get/get.dart';
import 'package:recipe_app/models/food_item.dart';

class FoodController extends GetxController {
  final RxList<FoodItem> _foodItemsList = <FoodItem>[
    FoodItem(
      title: 'Chorizo & mozzarella gnocchi bake & mozzarella gnocchi bake',
      category: 'Vegetarian',
      calorie: '300 kcal',
      time: '30 mins',
      coverImage: 'assets/images/chorizo.png',
      description: 'A delicious sample food item.',
      ingredients: ['Ingredient 1', 'Ingredient 2', 'Ingredient 3'],
    ),
    FoodItem(
      title: 'Beef Sirloin Steak',
      category: 'Non-Vegetarian',
      calorie: '500 kcal',
      time: '45 mins',
      coverImage: 'assets/images/steak.png',
      description: 'Another tasty sample food item.',
      ingredients: ['Ingredient A', 'Ingredient B', 'Ingredient C'],
    ),
    FoodItem(
      title: 'Beef Cheese Burger',
      category: 'Vegetarian',
      calorie: '300 kcal',
      time: '30 mins',
      coverImage: 'assets/images/burger.png',
      description: 'A delicious sample food item.',
      ingredients: ['Ingredient 1', 'Ingredient 2', 'Ingredient 3'],
    ),
    FoodItem(
      title: 'Shrimp & Cheese Taco',
      category: 'Non-Vegetarian',
      calorie: '500 kcal',
      time: '45 mins',
      coverImage: 'assets/images/taco.png',
      description: 'Another tasty sample food item.',
      ingredients: ['Ingredient A', 'Ingredient B', 'Ingredient C'],
    ),
  ].obs;

  final RxList<FoodItem> _filteredFoodItemsList = <FoodItem>[].obs;
  final RxList<FoodItem> _favoriteFoodItemsList = <FoodItem>[].obs;

  RxList<FoodItem> get foodItemsList => _foodItemsList;
  RxList<FoodItem> get filteredFoodItemsList => _filteredFoodItemsList;
  RxList<FoodItem> get favoriteFoodItemsList => _favoriteFoodItemsList;

  @override
  void onInit() {
    super.onInit();
    _filteredFoodItemsList.assignAll(_foodItemsList);
  }

  void addFoodItem(FoodItem foodItem) {
    _foodItemsList.add(foodItem);
    searchFoodItems("");
  }

  void addFavoriteFoodItem(FoodItem foodItem) {
    _favoriteFoodItemsList.add(foodItem);
  }

  void removeFavoriteFoodItem(FoodItem foodItem) {
    _favoriteFoodItemsList.remove(foodItem);
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
