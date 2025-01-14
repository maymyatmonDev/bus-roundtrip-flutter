import 'package:flutter/material.dart';

class DietModel {
  String? name;
  String? iconPath;
  String? level;
  String? duration;
  String? calorie;
  Color? boxColor;
  bool? viewIsSelected;

  DietModel(
      {required this.name,
      required this.iconPath,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.boxColor,
      required this.viewIsSelected});

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(DietModel(
        name: 'Honey Pancakge',
        iconPath: 'assets/icons/honey-pancakes.svg',
        level: 'Easy',
        duration: '30 min',
        calorie: '180 kcal',
        boxColor: Color(0xff9DCEFF),
        viewIsSelected: true));

    diets.add(DietModel(
      name: 'Canai Bread',
      iconPath: 'assets/icons/canai-bread.svg',
      level: 'Easy',
      duration: '20mins',
      calorie: '230kCal',
      boxColor: Color(0xffEEA4CE),
      viewIsSelected: false,
    ));
    return diets;
  }
}
