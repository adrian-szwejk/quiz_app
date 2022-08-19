import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app/data.dart';

//Background for home screen
Widget buildHomeBg() => Container(
      color: Colors.grey,
      // child: SvgPicture.asset(
      //   'assets/icons/bg.svg',
      //   width: double.infinity,
      //   height: double.infinity,
      //   fit: BoxFit.cover,
      // ),
    );

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

//Builds the social media icons used in profile screen
Widget buildSocialIcon(IconData icon) => CircleAvatar(
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
            buildSocialIcon(FontAwesomeIcons.github),
            const SizedBox(width: 15),
            buildSocialIcon(FontAwesomeIcons.slack),
            const SizedBox(width: 15),
            buildSocialIcon(FontAwesomeIcons.linkedin),
            const SizedBox(width: 15),
            buildSocialIcon(FontAwesomeIcons.facebook),
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
            side: const BorderSide(
              color: Colors.purple,
            ),
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
