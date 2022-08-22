import 'package:flutter/material.dart';

import 'package:quiz_app/welcome_screen.dart';

import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/welcome_screen.dart';
import 'package:quiz_app/data.dart';
import 'package:quiz_app/build_functions.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const WelcomeScreen(),
    );
  }
}
