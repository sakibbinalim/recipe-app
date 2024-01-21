import 'package:get/get.dart';
import 'package:recipe_app/controllers/bottom_nav_controller.dart';
import 'package:recipe_app/controllers/food_controller.dart';

void bindingControllers() {
  Get.put(BottomNavController());
  Get.put(FoodController());
}
