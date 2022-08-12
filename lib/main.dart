import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
  //Variables
  int _counter = 0;
  int _index = 0;
  int _navIdx = 0;

  //Variables for profile
  final double coverHeight = 280;
  final int profileHeight = 144;

  //Urls for social media buttons
  String git_url = 'https://github.com/adrian-szwejk';
  String slack_url =
      'https://app.slack.com/client/T02C95SRPR7/C02C95SSCKB/rimeto_profile/U02BWUGPP7G';
  String linked_url =
      'https://www.linkedin.com/in/adrian-szwejkowski-3202a81ab/';
  String fb_url = 'https://www.facebook.com/profile.php?id=100071873150146';

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

  //Navigation bar options
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  //Cover image widget for profile screen
  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29kaW5nfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  //Profile image function for profile screen
  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey[800],
        backgroundImage: const NetworkImage(
            'https://media-exp1.licdn.com/dms/image/C4E03AQGEoYWpWqKATA/profile-displayphoto-shrink_200_200/0/1644514130668?e=1665619200&v=beta&t=5QfuT-w5IFTPoopH6_5_r8tfZGLfJTvfef8DznZKYrg'),
      );

  //Extracted stack that builds cover image / pfp
  Widget buildTop() {
    final double bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        //Stacked from bottom up so pfp on top of cover image
        Positioned(
          //Distance btwn top of screen
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  //Async function to lauch urls when clicking on social media icons
  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //Builds the social media icons used in profile screen
  Widget buildSocialIcon(IconData icon, String url) => CircleAvatar(
        radius: 25,
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Icon(
                icon,
                size: 32,
              ),
            ),
          ),
        ),
      );

  Widget buildContent() => Column(
        children: [
          const SizedBox(height: 8),
          const Text(
            'Adrian Szwejkowski',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Student at the University of Illinois \nUrbana-Champaign',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.grey[600]),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialIcon(FontAwesomeIcons.github, git_url),
              const SizedBox(width: 15),
              buildSocialIcon(FontAwesomeIcons.slack, slack_url),
              const SizedBox(width: 15),
              buildSocialIcon(FontAwesomeIcons.linkedin, linked_url),
              const SizedBox(width: 15),
              buildSocialIcon(FontAwesomeIcons.facebook, fb_url),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          buildAbout(),
          const SizedBox(height: 32),
        ],
      );

  Widget buildAbout() => Column(
        children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Pre-Engineering Student at the University of Illinois Urbana-Champaign with many years of experience in mobile app development and CAD software. I am currently on track to transfer into the Grainger College engineering for either Computer Science + Economics or Civil Engineering.',
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    //fillQNA();
    return Scaffold(
      body: IndexedStack(
        index: _navIdx,
        children: <Widget>[
          //Stack
          //Home
          Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              centerTitle: true,
            ),
            body: const Text(
              'Home',
              style: optionStyle,
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
                    child: Text(
                      'Correct: $_counter Idx: $_index',
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
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
    );
  }

  void onTapHandler(int index) {
    setState(() {
      _navIdx = index;
    });
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
