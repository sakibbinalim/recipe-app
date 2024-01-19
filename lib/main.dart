import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/pages/bottom_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00B3BF),
        ),
        useMaterial3: true,
      ),
      home: BottomNav(),
    );
  }
}
