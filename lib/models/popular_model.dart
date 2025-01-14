import 'package:flutter/material.dart';

class PopularModel {
  String? name;
  String? iconPath;
  String? level;
  String? duration;
  String? calorie;
  Color? boxColor;
  bool? viewIsSelected;

  PopularModel(
      {required this.name,
      required this.iconPath,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.boxColor,
      required this.viewIsSelected});

  static List<PopularModel> getDiets() {
    List<PopularModel> diets = [];

    diets.add(PopularModel(
        name: 'Honey Pancakge',
        iconPath: 'assets/icons/honey-pancakes.svg',
        level: 'Easy',
        duration: '30 min',
        calorie: '180 kcal',
        boxColor: Color(0xff9DCEFF),
        viewIsSelected: true));

    diets.add(PopularModel(
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
