import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:get/get.dart';
import 'package:quiz_app/main.dart';
//import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:quiz_app/build_functions.dart';
import 'package:quiz_app/data.dart';
import 'package:quiz_app/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController myController = TextEditingController();

  //Ovveriding dispose function from TextEditingController
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildHomeBg(),
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
                  TextField(
                    controller: myController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
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
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            // Retrieve the text that the user has entered by using the
                            // TextEditingController.
                            content: Text(myController.text),
                          );
                        },
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeScreen(name: myController.text),
                        ),
                      );
                    },
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
