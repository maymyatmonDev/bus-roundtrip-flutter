import 'package:flutter/material.dart';

class BusListModel {
  String? operatorName;
  String? logo;
  double? rating;
  String? review;
  String? seats;
  String? gates;
  String? price;
  String? date;
  String? from;
  String? fromTime;
  String? to;
  String? toTime;
  String? duration;

  BusListModel({
    required this.operatorName,
    required this.logo,
    required this.rating,
    required this.review,
    required this.seats,
    required this.gates,
    required this.price,
    required this.date,
    required this.from,
    required this.fromTime,
    required this.to,
    required this.toTime,
    required this.duration,
  });

  @override
  String toString() {
    return 'BusListModel(operatorName: $operatorName, logo: $logo, rating: $rating, review: $review, seats: $seats, gates: $gates)';
  }

  static List<BusListModel> getBusList() {
    List<BusListModel> busList = [];

    busList.add(BusListModel(
        operatorName: 'Mann Shwe Myoe Taw',
        logo: 'assets/icons/buslogo.png',
        rating: 4,
        review: '1200',
        seats: '23',
        gates: 'Yangon-Meiktila-Mandalay',
        price: '22000',
        date: 'Sun, Aug 11 2024',
        from: 'Yangon',
        fromTime: '6:00 AM',
        to: 'Mandalay',
        toTime: '9:00 PM',
        duration: '2h 30m'));

    busList.add(BusListModel(
        operatorName: 'Aung Mingalar',
        logo: 'assets/icons/buslogo.png',
        rating: 3,
        review: '1500',
        seats: '20',
        gates: 'Yangon-Kyaukse-Mandalay',
        price: '24000',
        date: 'Sun, Aug 11 2024',
        from: 'Yangon',
        fromTime: '8:00 AM',
        to: 'Mandalay',
        toTime: '10:00 PM',
        duration: '2h 30m'));
    return busList;
  }
}
