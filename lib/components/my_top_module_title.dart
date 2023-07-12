import 'package:flutter/material.dart';

class MyTopModuleTitle extends StatelessWidget {
  final Color letter;
  final Color lightBackground;
  const MyTopModuleTitle(
      {Key? key, required this.letter, required this.lightBackground})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      height: 100,
      width: double.infinity,
      color: lightBackground,
      child: Text(
        "Bloque 1 \nAumenta tu motivación",
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
