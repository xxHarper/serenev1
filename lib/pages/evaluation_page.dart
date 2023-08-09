import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:serenev1/components/my_simple_button.dart';
import 'package:serenev1/components/my_simple_container.dart';
import 'package:serenev1/data/user_database.dart';
import 'package:serenev1/models/pre_assessment.dart';
import 'package:serenev1/pages/results_page.dart';

import '../components/my_pre_evaluation_radio_list.dart';
import '../components/my_simple_app_bar.dart';
import '../components/my_top_module_title.dart';
import '../services/local_storage.dart';

class EvaluationPage extends StatefulWidget {
  const EvaluationPage({Key? key}) : super(key: key);

  @override
  _EvaluationPageState createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  int _questionNumber = LocalStorage.prefs.getInt("questionNumber") ?? 1;
  PageController? _controller;

  bool enabledNext = false;

  List<Question> questions = [];
  double percent = LocalStorage.prefs.getDouble("percent") ?? 0.02;
  String auxPercent = "";
  double twoDecimalsPercent = 0.00;

  final String baiIntructions =
      "Indique para cada uno de los siguientes síntomas el grado en que se ha visto afectado por cada uno de ellos durante la última semana y en el momento actual. Elija de entre las siguientes opciones. \n\nDurante la última semana sentí…";

  final String bdiIntructions =
      "Por favor, lea cada grupo cuidadosamente y elija una oración en cada conjunto, la que mejor describa cómo se ha sentido en las últimas dos semanas, incluido el día de hoy. Si considera que varias oraciones en un mismo grupo reflejan cómo se ha sentido, elija la opción más alta.";

  final Color back = const Color(0xffBF426A);
  final Color lightBackground = const Color(0xffFFE2EA);
  final Color letter = const Color(0xff903A57);
  final Color backBar = Colors.pink.shade100;

  TextEditingController medicine = TextEditingController(
      text: LocalStorage.prefs.getString("medicine") ?? "");

  UserDatabase db = UserDatabase();
  final _myBox = Hive.box("User_Database");

  readQuestions() {
    // If this is the first time
    if (_myBox.get("selectedAnswers") == null) {
      db.initSelectedANswers();
    } else {
      db.loadSelectedAnswers();
    }

    sociodemographic.forEach((question) {
      questions.add(Question(text: question.text, options: question.options));
    });
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      readQuestions();
      _questionNumber = LocalStorage.prefs.getInt("questionNumber") ?? 1;
      _controller = PageController(initialPage: _questionNumber - 1);
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MySimpleAppBar(back: back, lightBackground: lightBackground),
      backgroundColor: back,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyTopModuleTitle(
                height: 50,
                title: "Evaluación Previa",
                letter: letter,
                lightBackground: lightBackground),

            // QUIZ
            Expanded(
              child: MySimpleContainer(
                  lightBackground: lightBackground,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // CONTADOR
                      Text(
                        "Pregunta $_questionNumber/${questions.length}",
                        style: TextStyle(
                          color: letter,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // PROGRESS BAR
                      LinearPercentIndicator(
                        animation: true,
                        animateFromLastPercent: true,
                        animationDuration: 1000,
                        lineHeight: 20,
                        percent: percent,
                        progressColor: letter,
                        backgroundColor: backBar,
                        center: Text(
                          "${(percent * 100).toStringAsFixed(2)}%",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      // DIVISON LINE
                      Divider(
                        thickness: 1,
                        color: letter,
                      ),

                      // INSTRUCTIONS
                      instructions(),

                      // ADD SOME SPACE
                      const SizedBox(
                        height: 15,
                      ),

                      // TEST
                      showTest(),

                      // BUTTONS
                      enabledButtons(),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  // SHOW THE TEST
  Widget showTest() {
    return Expanded(
      child: PageView.builder(
          controller: _controller,
          itemCount: sociodemographic.length,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {});
          },
          itemBuilder: (context, index) {
            // MAGIC FOR SETSTATE XD
            SchedulerBinding.instance.addPostFrameCallback((_) {
              setState(() {});
            });

            // VERTICAL RADIO BUTTON LIST

            return GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    questions[index].text,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.normal),
                  ),
                  Expanded(
                    child: MyPreEvaluationRadioList(
                      question: questions[index],
                      back: back,
                      options: questions[index].options,
                      questionNumber: index,
                    ),
                  ),

                  // IN CASE... ASK FOR THE MEDICINE
                  if (_questionNumber == 3 &&
                      db.selectedAnswers[index][0] == "Si")
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Colors.pink.shade100, width: 2)),
                      child: TextField(
                        controller: medicine,
                        onChanged: (value) {
                          LocalStorage.prefs.setString("medicine", value);
                        },
                        style: const TextStyle(fontSize: 18),
                        decoration: const InputDecoration(
                            hintText: "Qué medicamento es?",
                            border: InputBorder.none),
                      ),
                    ),
                ],
              ),
            );
          }),
    );
  }

  // SHOW INSTRUCTIONS
  Widget instructions() {
    // BAI
    if (_questionNumber > 3 && _questionNumber <= 23) {
      return Column(
        children: [
          Text(
            baiIntructions,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      );
    }

    // BDI-II
    if (_questionNumber > 23 && _questionNumber <= 44) {
      return Column(
        children: [
          Text(
            bdiIntructions,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      );
    }

    // MINI-1
    if (_questionNumber > 44 && _questionNumber <= 49) {
      return Column(
        children: const [
          Text(
            "Durante este último mes:",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          )
        ],
      );
    }

    // MINI-2
    if (_questionNumber > 49 && _questionNumber <= 50) {
      return Column(
        children: const [
          Text(
            "A lo largo de su vida:",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          )
        ],
      );
    }

    // OMS BIENESTAR GENERAL
    if (_questionNumber > 50) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Durante las últimas dos semanas...",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          )
        ],
      );
    }

    // SOCIODEMOGRAPHYC
    else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Cuestionario Sociodemográfico",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          )
        ],
      );
    }
  }

  // ENABLED OR NOT THE BUTTONS
  Widget enabledButtons() {
    if (db.selectedAnswers[_questionNumber - 1][0] != "") {
      setState(() {
        enabledNext = true;
      });
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // BACK BUTTON
        Visibility(
          visible: _questionNumber > 1 ? true : false,
          child: MySimpleButton(
            onPressed: () {
              _controller!.previousPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInExpo);

              setState(() {
                if (_questionNumber > 1) {
                  _questionNumber--;
                  percent -= 0.02;

                  auxPercent = percent.toStringAsFixed(2);
                  twoDecimalsPercent = double.parse(auxPercent);
                  percent = twoDecimalsPercent;
                  LocalStorage.prefs.setDouble("percent", percent);
                }

                LocalStorage.prefs.setInt("questionNumber", _questionNumber);
              });
            },
            txt: "Anterior",
            back: back,
            txtColor: Colors.white,
            btnWidth: 110,
          ),
        ),

        // NEXT BUTTON
        MySimpleButton(
          enabled: enabledNext,
          onPressed: () {
            if (_questionNumber < questions.length) {
              _controller!.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInExpo);

              setState(() {
                percent += 0.02;
                auxPercent = percent.toStringAsFixed(2);
                twoDecimalsPercent = double.parse(auxPercent);
                percent = twoDecimalsPercent;
                LocalStorage.prefs.setDouble("percent", percent);
                _questionNumber++;
                LocalStorage.prefs.setInt("questionNumber", _questionNumber);
                enabledNext = false;
              });
            } else {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const ResultsPage()));
            }
          },
          txt: _questionNumber < questions.length
              ? "Siguiente"
              : "Ver Resultado",
          back: back,
          txtColor: Colors.white,
          btnWidth: 110,
        )
      ],
    );
  }
}
