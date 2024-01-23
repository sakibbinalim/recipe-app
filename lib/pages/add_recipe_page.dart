import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/components/add_recipe_text_field.dart';
import 'package:recipe_app/controllers/food_controller.dart';
import 'package:recipe_app/models/food_item.dart';

class AddRecipePage extends StatelessWidget {
  const AddRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FoodController foodController = Get.find<FoodController>();
    final Map<String, TextEditingController> textControllers = {
      'Name': TextEditingController(),
      'Category': TextEditingController(),
      'Description': TextEditingController(),
      'Ingredients': TextEditingController(),
      'Calories': TextEditingController(),
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Recipe',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xE5D9D9D9),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var entry in textControllers.entries) ...[
                AddRecipeTextField(
                  textFieldTitle: entry.key,
                  textController: entry.value,
                ),
                const SizedBox(height: 20),
              ],
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF176B87),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {
                        Map<String, String> values = {};
                        textControllers.forEach((key, controller) {
                          values[key] = controller.text;
                        });

                        FoodItem newFoodItem = FoodItem(
                          title: values['Name'] ?? '',
                          category: values['Category'] ?? '',
                          description: values['Description'] ?? '',
                          ingredients: values['Ingredients']?.split(',') ?? [],
                          calorie: values['Calories'] ?? '',
                        );
                      },
                      child: const Text('Save Recipe'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
