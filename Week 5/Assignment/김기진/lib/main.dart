import 'package:flutter/material.dart';
import 'package:toon_world/screens/home_screen.dart';
import 'package:toon_world/services/api_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // key를 부모 class에 보냄

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
