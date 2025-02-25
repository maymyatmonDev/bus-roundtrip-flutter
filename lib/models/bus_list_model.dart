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
    return busList;
  }

  // Factory method to create an instance from JSON
  factory BusListModel.fromJson(Map<String, dynamic> json) {
    return BusListModel(
      operatorName: json['operatorName'],
      logo: json['logo'],
      rating: json['rating'].toDouble(), // Ensure it's a double
      review: json['review'],
      seats: json['seats'],
      gates: json['gates'],
      price: json['price'],
      date: json['date'],
      from: json['from'],
      fromTime: json['fromTime'],
      to: json['to'],
      toTime: json['toTime'],
      duration: json['duration'],
    );
  }
}

class BusResponse {
  final int page;
  final int limit;
  final int total;
  final int totalPages;
  final List<BusListModel> buses;

  BusResponse({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPages,
    required this.buses,
  });

  factory BusResponse.fromJson(Map<String, dynamic> json) {
    return BusResponse(
      page: json['page'] ?? 0,
      limit: json['limit'] ?? 0,
      total: json['total'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      buses: (json['buses'] as List)
          .map((busJson) => BusListModel.fromJson(busJson))
          .toList(),
    );
  }
}
