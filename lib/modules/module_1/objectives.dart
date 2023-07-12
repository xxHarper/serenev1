import 'package:flutter/material.dart';
import 'package:serenev1/components/my_checkbox_list.dart';
import 'package:serenev1/components/my_top_module_title.dart';

class Objectives extends StatefulWidget {
  const Objectives({Key? key}) : super(key: key);

  @override
  _ObjectivesState createState() => _ObjectivesState();
}

class _ObjectivesState extends State<Objectives> {
  final String instructions =
      "¡Es hora de empezar! Tómate un momento para reflexionar sobre los objetivos que te gustaría trabajar aquí. Estos serán los puntos en los que nos enfocaremos para mejorar tu bienestar.";

  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool checkboxValue4 = false;
  bool checkboxValue5 = false;
  bool checkboxValue6 = false;
  bool checkboxValue7 = false;
  bool checkboxValue8 = false;
  bool checkboxValue9 = false;
  bool checkboxValue10 = false;
  bool checkboxValue11 = false;
  bool checkboxValue12 = false;
  bool checkboxValue13 = false;

  final Color back = const Color(0xff42BF9F);
  final Color lightBackground = const Color(0XFFE2FFF7);
  final Color letter = const Color(0XFF3A907A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: back,
      ),
      backgroundColor: back,
      body: Column(
        children: [
          MyTopModuleTitle(letter: letter, lightBackground: lightBackground),
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              color: lightBackground,
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
                  CheckboxList(
                    checkboxValue: checkboxValue1,
                    txt:
                        'Aprender técnicas de relajación para reducir el estrés de manera efectiva.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue2,
                    txt:
                        'Mejorar la habilidad de comunicación interpersonal para establecer relaciones más saludables y satisfactorias.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue3,
                    txt:
                        'Optimizar la calidad y duración de mi descanso para mejorar mi bienestar general.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue4,
                    txt:
                        'Desarrollar habilidades para manejar y regular mis emociones de forma saludable y equilibrada.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue5,
                    txt: 'Fortalecer mi autoestima y confianza personal.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue6,
                    txt:
                        'Implementar estrategias efectivas para gestionar conflictos de manera constructiva.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue7,
                    txt:
                        'Incorporar regularmente técnicas de mindfulness para aumentar la conciencia plena.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue8,
                    txt:
                        'Adoptar hábitos que promuevan mi bienestar físico y mental.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue9,
                    txt:
                        'Desarrollar la capacidad de adaptación y flexibilidad ante situaciones cambiantes.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue10,
                    txt:
                        'Aprender a establecer límites personales de manera clara y asertiva.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue11,
                    txt:
                        'Ampliar mi autoconocimiento para comprender mejor mis necesidades emocionales y satisfacerlas.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue12,
                    txt:
                        'Mejorar mi habilidad para administrar el tiempo de manera eficiente y evitar la procrastinación.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue13,
                    txt:
                        'Promover la participación en actividades que incrementen mi bienestar emocional y disfrute personal.',
                    back: back,
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
