import 'package:flutter/material.dart';
import 'package:serenev1/bar%20graph/my_bar_graph.dart';
import 'package:serenev1/components/my_simple_app_bar.dart';
import 'package:serenev1/components/my_simple_container.dart';
import 'package:serenev1/components/my_top_module_title.dart';

import '../data/user_database.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({Key? key}) : super(key: key);

  final Color back = const Color(0xffFDA617);
  final Color lightBackground = const Color(0xffFFF8ED);
  final Color letter = const Color(0xffBD7A12);

  final style = const TextStyle(
      fontSize: 18, color: Color(0xffBD7A12), fontWeight: FontWeight.bold);

  UserDatabase db = UserDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: back,
      appBar: MySimpleAppBar(back: back, lightBackground: lightBackground),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Column(
          children: [
            // Title
            MyTopModuleTitle(
                height: 60,
                title: "Resultado",
                letter: letter,
                lightBackground: lightBackground),

            // Show results
            showResult(),
          ],
        ),
      ),
    );
  }

  Widget showResult() {
    db.loadResults();
    Color baiColor;
    Color bdiColor;
    Color miniColor;

    /*
    Se suman los ítems del BAI.
    -Ansiedad leve: Sumatoria ≥ 6, pero menor a 16
    -Ansiedad moderada: Sumatoria ≥ 16, pero menor a 31 */
    if (db.results[0] >= 6 && db.results[0] < 16) {
      baiColor = Colors.green;
    } else if (db.results[0] >= 16 && db.results[0] < 31) {
      baiColor = Colors.yellow;
    } else {
      baiColor = Colors.red;
    }

    /*
    Se suman los ítems del BDI-II.
    -Depresión leve: Sumatoria ≥ 14, pero menor a 20
    -Depresión moderada: Sumatoria ≥ 20, pero menor a 29 */
    if (db.results[1] >= 14 && db.results[1] < 20) {
      bdiColor = Colors.green;
    } else if (db.results[1] >= 20 && db.results[1] < 29) {
      bdiColor = Colors.yellow;
    } else {
      bdiColor = Colors.red;
    }

    /* Para el mini, 
    si tiene 10, leve, 
    si tiene 50 moderada, 
    otro sevrero */
    if (db.results[2] == 10) {
      miniColor = Colors.green;
    } else if (db.results[2] == 50) {
      miniColor = Colors.yellow;
    } else {
      miniColor = Colors.red;
    }

    List evaluationItems = [
      ["BAI (Inventario de Ansiedad de Beck)", 40, baiColor],
      ["BDI (Inventario de Depresión de Beck)", 63, bdiColor],
      ["Entrevista MINI", 100, miniColor],
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 150,
            child: MySimpleContainer(
              lightBackground: lightBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    evaluationItems[index][0],
                    style: style,
                  ),

                  // Some Space
                  const SizedBox(
                    height: 15,
                  ),

                  // Termometers
                  Expanded(
                    child: MyBarGraph(
                      result: double.parse(db.results[index].toString()),
                      x: index,
                      toY: double.parse(evaluationItems[index][1].toString()),
                      graphColor: evaluationItems[index][2],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
