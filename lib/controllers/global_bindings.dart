import 'package:get/get.dart';
import 'package:recipe_app/controllers/bottom_nav_controller.dart';
import 'package:recipe_app/controllers/food_controller.dart';
import 'package:recipe_app/controllers/toggle_button_controller.dart';

// void bindingControllers() {
//   Get.put(BottomNavController());
//   Get.lazyPut<FoodController>(() => FoodController());
// }

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(FoodController());
    Get.put(BottomNavController());
    Get.put(ToggleButtonController());
  }
}
