import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:serenev1/components/my_simple_button.dart';
import 'package:serenev1/components/my_simple_container.dart';
import 'package:serenev1/pages/results_page.dart';

import '../components/my_simple_app_bar.dart';
import '../components/my_top_module_title.dart';
import '../models/question_model.dart';
import '../services/local_storage.dart';
import '../models/option_widget.dart';

class EvaluationPage extends StatefulWidget {
  const EvaluationPage({Key? key}) : super(key: key);

  @override
  _EvaluationPageState createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  int _questionNumber = LocalStorage.prefs.getInt("questionNumber") ?? 1;
  PageController? _controller;

  List _items = [];
  List<Question> questions = [];
  double percent = 0.0;

  final Color back = const Color(0xffBF426A);
  final Color lightBackground = const Color(0xffFFE2EA);
  final Color letter = const Color(0xff903A57);

  Future readJson() async {
    final String response =
        await rootBundle.loadString("assets/sociodemographic.json");
    final data = await json.decode(response);

    setState(() {
      _items = data["sociodemographic"];

      _items.forEach((question) {
        questions.add(Question(
            text: question["question"],
            options: readOptions(question["option"].length, question)));
        /* print(question["question"]);
        print(question["option"].length); */
      });
    });
  }

  readOptions(int nOptions, question) {
    List<Option> _options = [];

    setState(() {
      for (var i = 0; i < nOptions; i++) {
        _options.add(
            Option(text: question["option"][i].toString(), reflection: "xd"));
      }
    });

    /* print("OPCIONES: ${_options}"); */
    return _options;
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      _questionNumber = LocalStorage.prefs.getInt("questionNumber") ?? 1;
      _controller =
          PageController(initialPage: _questionNumber, keepPage: true);
    });

    print("NUMERO: ${_questionNumber - 1}");
    readJson();
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
                        "Pregunta $_questionNumber/${_items.length}",
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
                        backgroundColor: Colors.pink.shade100,
                        center: const Text(
                          "10%",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      // DIVISON LINE
                      Divider(
                        thickness: 1,
                        color: letter,
                      ),

                      // QUESTIONS
                      Expanded(
                        child: PageView.builder(
                          controller: _controller,
                          itemCount: _items.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final _question = questions[index];
                            return buildQuestion(_question);
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
                                    duration: const Duration(milliseconds: 50),
                                    curve: Curves.easeInExpo);

                                setState(() {
                                  if (_questionNumber > 1) {
                                    _questionNumber--;
                                    percent -= 0.1;
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
                                /* readJson(); */
                                _controller!.nextPage(
                                    duration: const Duration(milliseconds: 50),
                                    curve: Curves.easeInExpo);

                                setState(() {
                                  percent += 0.1;
                                  _questionNumber++;
                                  /* print("VALE ESTO: ${_questionNumber}"); */
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

  Column buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.text,
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: OptionWidget(
            question: question,
            onClikedOption: (option) {
              if (question.isLocked) {
                return;
              } else {
                setState(() {
                  question.isLocked = true;
                  question.selectedOption = option;
                });
              }
            },
          ),
        ),
      ],
    );
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
        onPressed: () {
          if (_questionNumber < questions.length) {
            /* readJson(); */
            _controller!.nextPage(
                duration: Duration(milliseconds: 50), curve: Curves.easeInExpo);

            setState(() {
              _questionNumber++;
              print("VALE ESTO: ${_questionNumber}");
              LocalStorage.prefs.setInt("questionNumber", _questionNumber);
            });
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ResultsPage()));
          }
        },
        child: Text(_questionNumber < questions.length
            ? "Siguiente"
            : "Ver Resultado"));
  }
}
