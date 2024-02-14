import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryTitle;
  final String imagePath;
  const CategoryWidget(
      {super.key, required this.categoryTitle, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: const Color(0xFFF6F6F6),
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        title: Text(
          categoryTitle,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        trailing: SizedBox(
          width: 40,
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
