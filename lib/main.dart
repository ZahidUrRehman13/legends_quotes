import 'package:flutter/material.dart';
import 'package:legends_quotes/slider_screen.dart';
import 'package:legends_quotes/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SliderScreen(),
    );
  }
}
