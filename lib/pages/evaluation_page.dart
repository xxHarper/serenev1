import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:serenev1/components/my_radio_list.dart';
import 'package:serenev1/components/my_simple_button.dart';
import 'package:serenev1/components/my_simple_container.dart';
import 'package:serenev1/models/pre_assessment.dart';
import 'package:serenev1/pages/results_page.dart';

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

  List<Question> questions = [];
  List<Option> options = [];
  double percent = LocalStorage.prefs.getDouble("percent") ?? 0.0;

  final Color back = const Color(0xffBF426A);
  final Color lightBackground = const Color(0xffFFE2EA);
  final Color letter = const Color(0xff903A57);
  final Color backBar = Colors.pink.shade100;

  List<String> keys = [];

  readQuestions() {
    int i = 0;
    keys.clear();
    sociodemographic.forEach((question) {
      keys.add("answer$i");
      saveAnswer(
          question, LocalStorage.prefs.getString("answer$i") ?? "", "answer$i");

      questions.add(Question(
          text: question.text,
          options: question.options,
          selectedOption: question.selectedOption));

      i++;
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
                          "${percent * 100}%",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      // DIVISON LINE
                      Divider(
                        thickness: 1,
                        color: letter,
                      ),

                      // TEST
                      Expanded(
                        child: PageView.builder(
                          controller: _controller,
                          itemCount: sociodemographic.length,
                          physics: const NeverScrollableScrollPhysics(),
                          onPageChanged: (index) {
                            setState(() {});
                          },
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  questions[index].text,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal),
                                ),
                                Expanded(
                                  child: MyRadioList(
                                    question: questions[index],
                                    back: back,
                                    options: questions[index].options,
                                    questionKey: keys[index],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),

                      // BUTTONS
                      Row(
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
                                    percent -= 0.1;
                                    LocalStorage.prefs
                                        .setDouble("percent", percent);
                                  }

                                  LocalStorage.prefs.setInt(
                                      "questionNumber", _questionNumber);
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
                            onPressed: () {
                              if (_questionNumber < questions.length) {
                                _controller!.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInExpo);

                                setState(() {
                                  percent += 0.1;
                                  LocalStorage.prefs
                                      .setDouble("percent", percent);
                                  _questionNumber++;
                                  LocalStorage.prefs.setInt(
                                      "questionNumber", _questionNumber);
                                });
                              } else {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ResultsPage()));
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
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
