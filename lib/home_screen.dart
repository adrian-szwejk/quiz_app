import 'package:flutter/material.dart';
import 'package:quiz_app/data.dart';
import 'package:quiz_app/build_functions.dart';
import 'package:quiz_app/welcome_screen.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/data.dart';
import 'package:quiz_app/build_functions.dart';

//SVGS (NOT WORKING)
// import 'package:websafe_svg/websafe_svg.dart';
// import 'package:flutter/foundation.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  const HomeScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<HomeScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<HomeScreen> {
  //Variables
  int _counter = 0;
  int _index = 0;
  int _navIdx = 0;
  int urlIdx = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      //_index++;
    });
  }

  bool _checkAnswer(int key) {
    if (questions_.values.elementAt(_index) == key) {
      return true;
    }
    return false;
  }

  //Async function to lauch urls when clicking on social media icons
  launchUrl() async {
    Uri url = url_list.elementAt(urlIdx);
    if (await canLaunchUrl(url)) {
      await launchUrl();
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _navIdx,
          children: <Widget>[
            //Stack
            //Home
            Scaffold(
              body: Stack(
                children: [
                  buildHomeBg(),
                  moveVariables(name: widget.name),
                  //Text('Hello ${widget.name}'),
                ],
              ),
            ),
            //Learn
            Center(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
                      child: Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            TextButton(
                                onPressed: () {}, child: const Text('hello'))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                15.0, 50.0, 15.0, 10.0),
                            child: Text(
                              textAlign: TextAlign.center,
                              "${questions_.keys.elementAt(_index)}?",
                              style: const TextStyle(
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                          buildButton(
                            text:
                                answers_.values.elementAt(_index).elementAt(0),
                            color: const Color.fromARGB(255, 222, 219, 219),
                            fontColor: Colors.black,
                            fontSize: 20.0,
                            function:
                                _checkAnswer(0) ? _incrementCounter : () {},
                            key: "0",
                          ),
                          buildButton(
                            text:
                                answers_.values.elementAt(_index).elementAt(1),
                            color: const Color.fromARGB(255, 222, 219, 219),
                            fontColor: Colors.black,
                            fontSize: 20.0,
                            function:
                                _checkAnswer(1) ? _incrementCounter : () {},
                            key: "1",
                          ),
                          buildButton(
                            text:
                                answers_.values.elementAt(_index).elementAt(2),
                            color: const Color.fromARGB(255, 222, 219, 219),
                            fontColor: Colors.black,
                            fontSize: 20.0,
                            function:
                                _checkAnswer(2) ? _incrementCounter : () {},
                            key: "2",
                          ),
                          buildButton(
                            text:
                                answers_.values.elementAt(_index).elementAt(3),
                            color: const Color.fromARGB(255, 222, 219, 219),
                            fontColor: Colors.black,
                            fontSize: 20.0,
                            function:
                                _checkAnswer(3) ? _incrementCounter : () {},
                            key: "3",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Profile screen
            Scaffold(
              body: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  //Cover image/pfp
                  buildTop(),
                  //Socials & other info
                  buildContent(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _navIdx,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Learn',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face),
              label: 'Profile',
            ),
          ],
          onTap: (int index) {
            onTapHandler(index);
          },
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  void onTapHandler(int index) {
    setState(() {
      _navIdx = index;
    });
  }
}
