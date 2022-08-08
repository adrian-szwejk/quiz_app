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
  int _counter = 0;
  int q_index = 0;
  final Map<String, String> questions_ = {
    "What is the color of the sun": "2",
    "How many feet are in a mile": "3",
    "How many continents are there": "1",
    "What is the name of the current US president": "4",
  };
  final Map<int, Set<String>> answers_ = {
    0: {"Yellow", "White", "Orange", "Blue"},
    1: {"4280", "5200", "5280", "6280"},
    2: {"7", "6", "8", "5"},
    3: {"Barack Obama", "Hunter Biden", "Donald Trump", "Joe Biden"},
  };

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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  bool _checkAnswer(String question, String key) {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    //fillQNA();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'Correct: ' + '$_counter',
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            Expanded(
              child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        "${questions_.keys.elementAt(0)}?",
                        style: const TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    buildButton(
                      text: answers_.values.elementAt(0).elementAt(0),
                      color: const Color.fromARGB(255, 205, 29, 26),
                      fontColor: Colors.black,
                      fontSize: 20.0,
                      function: _incrementCounter,
                      key: "1",
                    ),
                    buildButton(
                      text: answers_.values.elementAt(0).elementAt(1),
                      color: const Color.fromARGB(255, 36, 202, 236),
                      fontColor: Colors.black,
                      fontSize: 20.0,
                      function: _incrementCounter,
                      key: "2",
                    ),
                    buildButton(
                      text: answers_.values.elementAt(0).elementAt(2),
                      color: const Color.fromARGB(255, 225, 62, 193),
                      fontColor: Colors.black,
                      fontSize: 20.0,
                      function: _incrementCounter,
                      key: "3",
                    ),
                    buildButton(
                      text: answers_.values.elementAt(0).elementAt(3),
                      color: const Color.fromARGB(255, 140, 242, 15),
                      fontColor: Colors.black,
                      fontSize: 20.0,
                      function: _incrementCounter,
                      key: "4",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Container buildButton({
  String text = "",
  Color fontColor = Colors.green,
  double fontSize = 30.0,
  Color? color,
  VoidCallback? function,
  String key = "1",
}) {
  return Container(
    padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 30.0),
    child: TextButton(
      key: Key(key),
      onPressed: function,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        elevation: MaterialStateProperty.all(3.0),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10.0)),
        fixedSize: MaterialStateProperty.all(const Size.fromWidth(350)),
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
