import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:recipe_app/components/detail_food_item_grid.dart';
import 'package:recipe_app/components/food_item_grid.dart';
import 'package:recipe_app/components/food_item_list_view.dart';

class ToggleButtonController extends GetxController {
  var currentIndex = 0.obs;

  List<Widget> views = [
    FoodItemGrid(),
    const FoodItemListView(),
    DetailFoodItemGrid(),
  ];

  Widget get currentView => views[currentIndex.value];

  void changeView(int index) {
    currentIndex.value = index;
  }
}
