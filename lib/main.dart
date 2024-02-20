import 'package:flutter/material.dart';
import 'package:mbi_calculator/views/calculator_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff0a0d22)
      ),
      home: const CalculatorView(),
    );
  }
}


