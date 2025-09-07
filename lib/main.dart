import 'package:flutter/material.dart';
import 'package:edu_voice_main/screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: StartScreen());
  }
}
