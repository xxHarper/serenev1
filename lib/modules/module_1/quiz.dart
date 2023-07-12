import 'package:flutter/material.dart';
import 'package:serenev1/components/top_module_1.dart';
import 'package:serenev1/modules/module_1/video.dart';

import '../../models/option_widget.dart';
import '../../models/question_model.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  PageController? _controller;
  int _questionNumber = 1;

  @override
  void initState() {
    super.initState();

    setState(() {
      _controller = PageController(initialPage: 0, keepPage: true);
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
      appBar: AppBar(
        backgroundColor: const Color(0xff42BF9F),
      ),
      backgroundColor: const Color(0xff42BF9F),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopModule1(),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 80,
              width: double.infinity,
              color: const Color(0XFFE2FFF7),
              child: const Text(
                "Contesta las siguientes preguntas que serán para reflexionar sobre tus motivaciones y metas:",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Color(0XFF3A907A),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              color: const Color(0XFFE2FFF7),
              /* color: Colors.red, */
              height: 420,
              padding: const EdgeInsets.symmetric(vertical: 1),
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Pregunta $_questionNumber/${quiz.length}",
                    style: const TextStyle(
                      color: Color(0XFF3A907A),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Color(0XFF3A907A),
                  ),
                  Container(
                    height: 320,
                    color: const Color(0XFFE2FFF7),
                    /* color: Colors.red, */
                    child: Expanded(
                        child: PageView.builder(
                      controller: _controller,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: quiz.length,
                      itemBuilder: (context, index) {
                        final _question = quiz[index];
                        return buildQuestion(_question);
                      },
                    )),
                  ),
                  buildElevatedButton(),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 100,
              width: double.infinity,
              color: const Color(0XFFE2FFF7),
              child: const Text(
                "Nota: Esto no es una evaluación psicológica, no está validada como una herramienta de diagnóstico, solo son preguntas que permiten una reflexión.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Color(0XFF3A907A),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            question.text,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.justify,
          ),
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
        style: OutlinedButton.styleFrom(
            /* fixedSize: const Size.fromWidth(250), */
            backgroundColor: const Color(0xff42BF9F),
            side: const BorderSide(width: 2, color: Colors.black)),
        onPressed: () {
          if (_questionNumber < quiz.length) {
            /* readJson(); */
            _controller!.nextPage(
                duration: const Duration(milliseconds: 50),
                curve: Curves.easeInExpo);

            setState(() {
              _questionNumber++;
            });
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Video()));
          }
        },
        child: Text(_questionNumber < quiz.length ? "Siguiente" : "Finalizar"));
  }
}
