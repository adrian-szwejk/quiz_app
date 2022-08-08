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
  Map<String, String> questions_ = new Map();

  void fillQuestions() {
    questions_["What is the color of the sun"] = "2";
    //White
    questions_["How many feet are in a mile"] = "3";
    //5280
    questions_["How many continents are there"] = "1";
    //7
    questions_["What is the name of the current US president"] = "4";
    //7
  }

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
    fillQuestions();
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
                        questions_.keys.elementAt(0),
                        style: const TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    buildButton(
                      text: "Answer 1",
                      color: const Color.fromARGB(255, 205, 29, 26),
                      fontColor: Colors.black,
                      fontSize: 20.0,
                      function: _incrementCounter,
                      key: "1",
                    ),
                    buildButton(
                      text: "Answer 2",
                      color: const Color.fromARGB(255, 36, 202, 236),
                      fontColor: Colors.black,
                      fontSize: 20.0,
                      function: _incrementCounter,
                      key: "2",
                    ),
                    buildButton(
                      text: "Answer 3",
                      color: const Color.fromARGB(255, 225, 62, 193),
                      fontColor: Colors.black,
                      fontSize: 20.0,
                      function: _incrementCounter,
                      key: "3",
                    ),
                    buildButton(
                      text: "Answer 4",
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
