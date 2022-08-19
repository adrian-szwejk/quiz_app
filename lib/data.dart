import 'package:flutter/material.dart';

//Variables for profile
final double coverHeight = 280;
final int profileHeight = 144;

//Urls for social media buttons
Set<Uri> url_list = {
  Uri.parse('https://flutter.dev'),
  Uri.parse('https://github.com/adrian-szwejk'),
  Uri.parse(
      'https://app.slack.com/client/T02C95SRPR7/C02C95SSCKB/rimeto_profile/U02BWUGPP7G'),
  Uri.parse('https://www.linkedin.com/in/adrian-szwejkowski-3202a81ab/'),
  Uri.parse('https://www.facebook.com/profile.php?id=100071873150146'),
};

//Questions and answers for learning screen
final Map<String, int> questions_ = {
  "What is the color of the sun": 1,
  "How many feet are in a mile": 2,
  "How many continents are there": 0,
  "What is the name of the current US president": 3,
};
final Map<int, Set<String>> answers_ = {
  0: {"Yellow", "White", "Orange", "Blue"},
  1: {"4280", "5200", "5280", "6280"},
  2: {"7", "6", "8", "5"},
  3: {"Barack Obama", "Hunter Biden", "Donald Trump", "Joe Biden"},
};

//Navigation bar options
const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
