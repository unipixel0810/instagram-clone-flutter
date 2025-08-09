import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/exercise_dice_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise Dice',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const ExerciseDiceScreen(),
    );
  }
}