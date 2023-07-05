import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
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
          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Pregunta $_questionNumber/${questions.length}"),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: questions.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final _question = questions[index];
                    return buildQuestion(_question);
                  },
                ),
              ),
              buildElevatedButton(),
              ElevatedButton(
                  onPressed: () {
                    _controller!.previousPage(
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeInExpo);

                    setState(() {
                      _questionNumber--;
                      LocalStorage.prefs
                          .setInt("questionNumber", _questionNumber);
                    });
                  },
                  child: Text("Anterior")),
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
            _controller!.nextPage(
                duration: Duration(milliseconds: 250),
                curve: Curves.easeInExpo);

            setState(() {
              _questionNumber++;
              LocalStorage.prefs.setInt("questionNumber", _questionNumber);
            });
          } else {}
        },
        child: Text(_questionNumber < questions.length
            ? "Siguiente"
            : "Ver Resultado"));
  }
}
