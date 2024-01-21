// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FoodItem {
  final String title;
  final String category;
  final String calorie;
  final String time;
  final String coverImage;
  final String description;
  final List<String> ingredients;
  FoodItem({
    required this.title,
    required this.category,
    required this.calorie,
    required this.time,
    required this.coverImage,
    required this.description,
    required this.ingredients,
  });

  FoodItem copyWith({
    String? title,
    String? category,
    String? calorie,
    String? time,
    String? coverImage,
    String? description,
    List<String>? ingredients,
  }) {
    return FoodItem(
      title: title ?? this.title,
      category: category ?? this.category,
      calorie: calorie ?? this.calorie,
      time: time ?? this.time,
      coverImage: coverImage ?? this.coverImage,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'category': category,
      'calorie': calorie,
      'time': time,
      'coverImage': coverImage,
      'description': description,
      'ingredients': ingredients,
    };
  }

  factory FoodItem.fromMap(Map<String, dynamic> map) {
    return FoodItem(
      title: map['title'] as String,
      category: map['category'] as String,
      calorie: map['calorie'] as String,
      time: map['time'] as String,
      coverImage: map['coverImage'] as String,
      description: map['description'] as String,
      ingredients: List<String>.from(
        (map['ingredients'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodItem.fromJson(String source) =>
      FoodItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FoodItem(title: $title, category: $category, calorie: $calorie, time: $time, coverImage: $coverImage, description: $description, ingredients: $ingredients)';
  }

  @override
  bool operator ==(covariant FoodItem other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.category == category &&
        other.calorie == calorie &&
        other.time == time &&
        other.coverImage == coverImage &&
        other.description == description &&
        listEquals(other.ingredients, ingredients);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        category.hashCode ^
        calorie.hashCode ^
        time.hashCode ^
        coverImage.hashCode ^
        description.hashCode ^
        ingredients.hashCode;
  }
}
