import 'package:flutter/material.dart';
import 'package:serenev1/components/top_module_1.dart';

class Objectives extends StatefulWidget {
  const Objectives({Key? key}) : super(key: key);

  @override
  _ObjectivesState createState() => _ObjectivesState();
}

class _ObjectivesState extends State<Objectives> {
  final String instructions =
      "¡Es hora de empezar! Tómate un momento para reflexionar sobre los objetivos que te gustaría trabajar aquí. Estos serán los puntos en los que nos enfocaremos para mejorar tu bienestar.";

  bool checkboxValue1 = true;
  bool checkboxValue2 = true;
  bool checkboxValue3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff42BF9F),
      ),
      backgroundColor: const Color(0xff42BF9F),
      body: Column(
        children: [
          const TopModule1(),
          Expanded(
              child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            color: const Color(0XFFE2FFF7),
            child: Column(
              children: [
                // INSTRUCTIONS
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10.0),
                  child: Text(
                    instructions,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CheckboxListTile(
                  value: checkboxValue1,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue1 = value!;
                    });
                  },
                  title: const Text(
                      'Aprender técnicas de relajación para reducir el estrés de manera efectiva.'),
                  /* subtitle: const Text('Supporting text'), */
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
