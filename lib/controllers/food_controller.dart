import 'package:get/get.dart';
import 'package:recipe_app/constants/default_food_items.dart';
import 'package:recipe_app/models/food_item.dart';

class FoodController extends GetxController {
  final RxList<FoodItem> _foodItemsList = defaultFoodItems.obs;

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
