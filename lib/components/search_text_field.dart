import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 30),
      decoration: ShapeDecoration(
        color: const Color(0xFFF1F1F1),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Color(0xFF00B3BF)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.search,
            ),
            SizedBox(width: 4),
            Text(
              'Type your ingredients',
              style: TextStyle(color: Color(0xFFAEAEAE), fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
