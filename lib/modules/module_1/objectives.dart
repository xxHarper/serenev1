import 'package:flutter/material.dart';
import 'package:serenev1/components/my_checkbox_list.dart';
import 'package:serenev1/components/my_simple_button.dart';
import 'package:serenev1/components/my_top_module_title.dart';
import 'package:serenev1/modules/module_1/foda.dart';

import '../../components/my_simple_app_bar.dart';
import '../../services/local_storage.dart';

class Objectives extends StatefulWidget {
  const Objectives({Key? key}) : super(key: key);

  @override
  _ObjectivesState createState() => _ObjectivesState();
}

class _ObjectivesState extends State<Objectives> {
  final String instructions =
      "¡Es hora de empezar! Tómate un momento para reflexionar sobre los objetivos que te gustaría trabajar aquí. Estos serán los puntos en los que nos enfocaremos para mejorar tu bienestar.";

  /* bool example = LocalStorage.prefs.getBool("cbox1") ?? false; */

  bool checkboxValue1 = LocalStorage.prefs.getBool("cbox1") ?? false;
  bool checkboxValue2 = LocalStorage.prefs.getBool("cbox2") ?? false;
  bool checkboxValue3 = LocalStorage.prefs.getBool("cbox3") ?? false;
  bool checkboxValue4 = LocalStorage.prefs.getBool("cbox4") ?? false;
  bool checkboxValue5 = LocalStorage.prefs.getBool("cbox5") ?? false;
  bool checkboxValue6 = LocalStorage.prefs.getBool("cbox6") ?? false;
  bool checkboxValue7 = LocalStorage.prefs.getBool("cbox7") ?? false;
  bool checkboxValue8 = LocalStorage.prefs.getBool("cbox8") ?? false;
  bool checkboxValue9 = LocalStorage.prefs.getBool("cbox9") ?? false;
  bool checkboxValue10 = LocalStorage.prefs.getBool("cbox10") ?? false;
  bool checkboxValue11 = LocalStorage.prefs.getBool("cbox11") ?? false;
  bool checkboxValue12 = LocalStorage.prefs.getBool("cbox12") ?? false;
  bool checkboxValue13 = LocalStorage.prefs.getBool("cbox13") ?? false;

  final Color back = const Color(0xff42BF9F);
  final Color lightBackground = const Color(0XFFE2FFF7);
  final Color letter = const Color(0XFF3A907A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MySimpleAppBar(back: back, lightBackground: lightBackground),
      backgroundColor: back,
      body: Column(
        children: [
          MyTopModuleTitle(
              title: "Bloque 1 \nAumenta tu motivación",
              letter: letter,
              lightBackground: lightBackground),
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
                    localName: "cbox1",
                    txt:
                        'Aprender técnicas de relajación para reducir el estrés de manera efectiva.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue2,
                    localName: "cbox2",
                    txt:
                        'Mejorar la habilidad de comunicación interpersonal para establecer relaciones más saludables y satisfactorias.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue3,
                    localName: "cbox3",
                    txt:
                        'Optimizar la calidad y duración de mi descanso para mejorar mi bienestar general.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue4,
                    localName: "cbox4",
                    txt:
                        'Desarrollar habilidades para manejar y regular mis emociones de forma saludable y equilibrada.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue5,
                    localName: "cbox5",
                    txt: 'Fortalecer mi autoestima y confianza personal.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue6,
                    localName: "cbox6",
                    txt:
                        'Implementar estrategias efectivas para gestionar conflictos de manera constructiva.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue7,
                    localName: "cbox7",
                    txt:
                        'Incorporar regularmente técnicas de mindfulness para aumentar la conciencia plena.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue8,
                    localName: "cbox8",
                    txt:
                        'Adoptar hábitos que promuevan mi bienestar físico y mental.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue9,
                    localName: "cbox9",
                    txt:
                        'Desarrollar la capacidad de adaptación y flexibilidad ante situaciones cambiantes.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue10,
                    localName: "cbox10",
                    txt:
                        'Aprender a establecer límites personales de manera clara y asertiva.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue11,
                    localName: "cbox11",
                    txt:
                        'Ampliar mi autoconocimiento para comprender mejor mis necesidades emocionales y satisfacerlas.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue12,
                    localName: "cbox12",
                    txt:
                        'Mejorar mi habilidad para administrar el tiempo de manera eficiente y evitar la procrastinación.',
                    back: back,
                  ),
                  CheckboxList(
                    checkboxValue: checkboxValue13,
                    localName: "cbox13",
                    txt:
                        'Promover la participación en actividades que incrementen mi bienestar emocional y disfrute personal.',
                    back: back,
                  ),
                  MySimpleButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Foda()),
                      );
                    },
                    txt: "Listo",
                    back: back,
                    txtColor: Colors.white,
                    btnWidth: 120,
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
