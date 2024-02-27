import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final Function(String) onSearch;
  final String initialQuery;

  const SearchTextField(
      {super.key, required this.onSearch, required this.initialQuery});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller =
        TextEditingController(text: initialQuery);
    return TextField(
      controller: controller,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        fillColor: const Color(0xFFF1F1F1),
        filled: true,
        prefixIcon: const Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF00B3BF), width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 4, 151, 161), width: 2.0),
        ),
        hintText: 'Type your ingredients',
      ),
      onChanged: (query) => onSearch(query),
    );
  }
}
