import 'package:flutter/material.dart';

class TopModule1 extends StatelessWidget {
  const TopModule1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      height: 100,
      width: double.infinity,
      color: const Color(0XFFE2FFF7),
      child: const Text(
        "Bloque 1 \nAumenta tu motivación",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0XFF3A907A),
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
