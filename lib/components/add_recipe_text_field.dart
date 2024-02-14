import 'package:flutter/material.dart';

class AddRecipeTextField extends StatelessWidget {
  final String textFieldTitle;
  final TextEditingController textController;
  final List<String> categories;

  const AddRecipeTextField({
    super.key,
    required this.textFieldTitle,
    required this.textController,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    if (textFieldTitle == 'Category') {
      return DropdownButtonFormField(
        items: categories.map((String categoty) {
          return DropdownMenuItem(
              value: categoty,
              child: Text(
                categoty,
                style: const TextStyle(fontSize: 15),
              ));
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            textController.text = newValue;
          }
        },
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
    } else {
      return TextField(
        controller: textController,
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
}
