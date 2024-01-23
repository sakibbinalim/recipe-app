import 'package:flutter/material.dart';
import 'package:recipe_app/components/add_recipe_text_field.dart';

class AddRecipePage extends StatelessWidget {
  const AddRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              const AddRecipeTextField(
                textFieldTitle: 'Name',
              ),
              const SizedBox(height: 20),
              const AddRecipeTextField(
                textFieldTitle: 'Category',
              ),
              const SizedBox(height: 20),
              const AddRecipeTextField(
                textFieldTitle: 'Description',
              ),
              const SizedBox(height: 20),
              const AddRecipeTextField(
                textFieldTitle: 'Ingredients',
              ),
              const SizedBox(height: 20),
              const AddRecipeTextField(
                textFieldTitle: 'Calories',
              ),
              const SizedBox(height: 20),
              const AddRecipeTextField(
                textFieldTitle: 'Upload Image',
              ),
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
                      onPressed: () {},
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
