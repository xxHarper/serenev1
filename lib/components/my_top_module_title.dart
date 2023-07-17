import 'package:flutter/material.dart';

class MyTopModuleTitle extends StatelessWidget {
  final String title;
  final Color letter;
  final Color lightBackground;
  final double height;

  const MyTopModuleTitle(
      {Key? key,
      required this.title,
      required this.letter,
      required this.lightBackground, this.height = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      height: height,
      width: double.infinity,
      color: lightBackground,
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
