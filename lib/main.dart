import 'package:bus_roundtrip_flutter/pages/bus_home.dart';
import 'package:bus_roundtrip_flutter/pages/bus_result.dart';
import 'package:bus_roundtrip_flutter/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bus Roundtrip',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        home: BusSearchHome());
    // home: BusResult());
  }
}
