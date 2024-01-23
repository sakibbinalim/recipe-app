import 'package:flutter/material.dart';

class AddRecipeTextField extends StatelessWidget {
  final String textFieldTitle;

  const AddRecipeTextField({super.key, required this.textFieldTitle});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        labelText: textFieldTitle,
        fillColor: const Color(0xFFF1F1F1),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFAEAEAE), width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFF00B3BF),
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
