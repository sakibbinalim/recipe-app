import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearch;

  const SearchTextField(
      {super.key, required this.searchController, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
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