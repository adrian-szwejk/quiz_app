import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
//import 'package:quiz_app/screens/quiz/quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    //Takes 2/6 space
                    flex: 2,
                  ),
                  Text(
                    "Let's play Quiz,",
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Enter your name below",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ),
                  const Spacer(), //Takes 1/6 space
                  const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                      hintText: 'Full name',
                      filled: true,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                  const Spacer(), //Takes 1/6 space
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding),
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Start Quiz",
                        style: Theme.of(context).textTheme.button?.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                      ),
                    ),
                  ),
                  const Spacer(
                    //Takes 2/6 space
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
