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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Number of correct answers: ',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            buildButton(
              text: "Answer 1",
              color: const Color.fromARGB(255, 205, 29, 26),
              fontColor: Colors.black,
              fontSize: 20.0,
              function: _incrementCounter,
            ),
            buildButton(
              text: "Answer 2",
              color: const Color.fromARGB(255, 36, 202, 236),
              fontColor: Colors.black,
              fontSize: 20.0,
              function: _incrementCounter,
            ),
            buildButton(
              text: "Answer 3",
              color: const Color.fromARGB(255, 225, 62, 193),
              fontColor: Colors.black,
              fontSize: 20.0,
              function: _incrementCounter,
            ),
            buildButton(
              text: "Answer 4",
              color: const Color.fromARGB(255, 140, 242, 15),
              fontColor: Colors.black,
              fontSize: 20.0,
              function: _incrementCounter,
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
}) {
  return Container(
    padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
    child: TextButton(
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
