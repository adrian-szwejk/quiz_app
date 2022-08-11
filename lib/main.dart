import 'package:flutter/material.dart';

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
      home: const HomePage(title: 'Quiz App'),
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
  //Navigation bar options
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  //Other screens
  final Widget _myHome = MyHome();
  final Widget _myProfile = MyProfile();
  final Widget _myLearn = MyLearn();

  //Other variables

  int _nav_idx = 0;
  

  @override
  Widget build(BuildContext context) {
    //fillQNA();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center (
        child: _widgetOptions.elementAt(_nav_idx),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _nav_idx,
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
          this.onTapHandler(index);
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //Helper functions for bottom nav bar
  Widget getBody() {
    if (_nav_idx == 0) {
      return this._myHome;
    } else if (_nav_idx == 1) {
      return this._myLearn;
    } else {
      return this._myProfile;
    }
  }

  void onTapHandler(int index) {
    setState(() {
      _nav_idx = index;
    });
  }
}

//Classes for each screen on bottom nav bar
class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("My Profile"),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Home screen"),
    );
  }
}

class MyLearn extends State<HomePage> {

  int _counter = 0;
  int _index = 0;

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

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'Correct: $_counter Idx: $_index',
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            Expanded(
              child: Align(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 10.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        "${questions_.keys.elementAt(_index)}?",
                        style: const TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    buildButton(
                      text: answers_.values.elementAt(_index).elementAt(0),
                      color: const Color.fromARGB(255, 205, 29, 26),
                      fontColor: Colors.black,
                      fontSize: 20.0,
                      function: _checkAnswer(0) ? _incrementCounter : () {},
                      key: "0",
                    ),
                    buildButton(
                      text: answers_.values.elementAt(_index).elementAt(1),
                      color: const Color.fromARGB(255, 36, 202, 236),
                      fontColor: Colors.black,
                      fontSize: 20.0,
                      function: _checkAnswer(1) ? _incrementCounter : () {},
                      key: "1",
                    ),
                    buildButton(
                      text: answers_.values.elementAt(_index).elementAt(2),
                      color: const Color.fromARGB(255, 225, 62, 193),
                      fontColor: Colors.black,
                      fontSize: 20.0,
                      function: _checkAnswer(2) ? _incrementCounter : () {},
                      key: "2",
                    ),
                    buildButton(
                      text: answers_.values.elementAt(_index).elementAt(3),
                      color: const Color.fromARGB(255, 140, 242, 15),
                      fontColor: Colors.black,
                      fontSize: 20.0,
                      function: _checkAnswer(3) ? _incrementCounter : () {},
                      key: "3",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
  }
}

//Helper function to build buttons

Container buildButton({
  String text = "",
  Color fontColor = Colors.black,
  double fontSize = 30.0,
  Color color = Colors.grey,
  VoidCallback? function,
  String key = "1",
}) {
  return Container(
    padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 30.0),
    child: TextButton(
      key: Key(key),
      onPressed: () {
        function;
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.focused) && function != null) {
            return Colors.green;
          }
          if (states.contains(MaterialState.pressed) && function != null) {
            return color.withOpacity(0.5);
          }
          if (states.contains(MaterialState.hovered) && function != null) {
            return color.withOpacity(0.75);
          }
          return color;
        }),
        //backgroundColor: MaterialStateProperty.all(color),
        elevation: MaterialStateProperty.all(3.0),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10.0)),
        fixedSize: MaterialStateProperty.all(const Size(350, 50)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: fontColor,
          fontSize: fontSize,
        ),
      ),
    ),
  );
}


  // void fillQNA() {
  //   //Fills questions and answers maps with values
  //   questions_["What is the color of the sun"] = "2";
  //   //White
  //   answers_[0]?.add("Yellow");
  //   answers_[0]?.add("White");
  //   answers_[0]?.add("Orange");
  //   answers_[0]?.add("Blue");

  //   questions_["How many feet are in a mile"] = "3";
  //   //5280
  //   answers_[1]?.add("4280");
  //   answers_[1]?.add("5200");
  //   answers_[1]?.add("5280");
  //   answers_[1]?.add("6280");

  //   questions_["How many continents are there"] = "1";
  //   //7
  //   answers_[2]?.add("7");
  //   answers_[2]?.add("6");
  //   answers_[2]?.add("8");
  //   answers_[2]?.add("5");

  //   questions_["What is the name of the current US president"] = "4";
  //   //Joe Biden
  //   answers_[3]?.add("Barack Obama");
  //   answers_[3]?.add("Hunter Biden");
  //   answers_[3]?.add("Donald Trump");
  //   answers_[3]?.add("Joe Biden");
  //   print(answers_[0]);
  // }