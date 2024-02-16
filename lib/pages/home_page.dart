import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/toggle_button_controller.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:recipe_app/components/detail_food_item_grid.dart';
import 'package:recipe_app/components/food_item_grid.dart';
import 'package:recipe_app/components/food_item_list_view.dart';
import 'package:recipe_app/components/search_text_field.dart';
import 'package:recipe_app/controllers/food_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FoodController foodController = Get.find<FoodController>();
    final ToggleButtonController toggleButtonController =
        Get.find<ToggleButtonController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xE5D9D9D9),
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What is in your Kitchen?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                'Enter some ingredients',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              SearchTextField(
                onSearch: (query) => foodController.searchFoodItems(query),
              ),
              const SizedBox(height: 10),

              // toggle button
              Align(
                alignment: Alignment.centerRight,
                child: Obx(() {
                  return ToggleSwitch(
                    minWidth: 50,
                    minHeight: 30,
                    inactiveBgColor: Colors.white,
                    inactiveFgColor: Colors.grey[600],
                    cornerRadius: 5,
                    initialLabelIndex:
                        toggleButtonController.currentIndex.value,
                    totalSwitches: toggleButtonController.views.length,
                    icons: const [
                      Icons.grid_view_rounded,
                      Icons.view_list,
                      Icons.grid_on_rounded
                    ],
                    dividerColor: Colors.grey,
                    borderWidth: 1.2,
                    borderColor: const [Colors.grey],
                    onToggle: (index) {
                      toggleButtonController.changeView(index!);
                    },
                  );
                }),
              ),
              const SizedBox(height: 10),
              Obx(() {
                return toggleButtonController.currentView;
              }),
            ],
          ),
        ),
      ),
    );
  }
}
