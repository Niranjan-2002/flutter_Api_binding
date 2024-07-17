
import 'package:api_binding/views/HomeScreen.dart';
import 'package:api_binding/views/HomeScreen2.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});


//fetvh api



  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home://HomeScreen()
      ComplexApi()
    );
  }
}
