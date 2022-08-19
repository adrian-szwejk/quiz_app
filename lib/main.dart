import 'package:flutter/material.dart';

import 'package:quiz_app/welcome_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:quiz_app/welcome_screen.dart';
import 'package:quiz_app/data.dart';
import 'package:quiz_app/build_functions.dart';

//SVGS (NOT WORKING)
// import 'package:websafe_svg/websafe_svg.dart';
// import 'package:flutter/foundation.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const QuizScreen();
  }
}
