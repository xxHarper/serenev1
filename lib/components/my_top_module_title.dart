import 'package:flutter/material.dart';

class MyTopModuleTitle extends StatelessWidget {
  final String title;
  final Color letter;
  final Color lightBackground;
  final double height;
  /* final double vertical;
  final double horizontal; */

  const MyTopModuleTitle(
      {Key? key,
      required this.title,
      required this.letter,
      required this.lightBackground,
      this.height = 100,
      /* this.vertical = 5,
      this.horizontal = 12 */})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      /* margin: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal), */
      height: height,
      width: double.infinity,
      /* color: lightBackground, */
      decoration: BoxDecoration(
          color: lightBackground,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: letter,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
