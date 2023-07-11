import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:serenev1/pages/results_page.dart';

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
        _options.add(Option(text: question["option"][i].toString()));
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
      appBar: AppBar(
        title: Text("Evaluación Previa"),
        backgroundColor: Color(0xff4293BF),
      ),
      body: Container(
        width: double.infinity,
        /* BACKGROUND COLOR  */
        color: Color(0xff4293BF),
        child: Container(
          color: Color(0xffE2F5FF),
          /* margin: EdgeInsets.all(15.0), */
          margin: EdgeInsets.symmetric(vertical: 25, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Pregunta $_questionNumber/${_items.length}"),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _items.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final _question = questions[index];
                    return buildQuestion(_question);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _controller!.previousPage(
                            duration: Duration(milliseconds: 50),
                            curve: Curves.easeInExpo);

                        setState(() {
                          if (_questionNumber > 1) {
                            _questionNumber--;
                          }

                          LocalStorage.prefs
                              .setInt("questionNumber", _questionNumber);
                        });
                      },
                      child: Text("Anterior")),
                  buildElevatedButton(),
                ],
              ),
            ],
          ),
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
        SizedBox(
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
