import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive/hive.dart';
import 'package:serenev1/components/my_simple_button.dart';
import 'package:serenev1/components/my_simple_container.dart';
import 'package:serenev1/components/my_top_module_title.dart';
import 'package:serenev1/modules/module_1/quiz_results.dart';

import '../../components/my_quiz_radio_list.dart';
import '../../components/my_simple_app_bar.dart';
import '../../data/user_database.dart';
import '../../models/mini_quiz_model.dart';
import '../../models/pre_assessment.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final Color letter = const Color(0XFF3A907A);
  final Color lightBackground = const Color(0XFFE2FFF7);
  final Color back = const Color(0xff42BF9F);

  PageController? _controller;
  int _questionNumber = 1;
  bool enabledNext = false;

  List<Question> questions = [];

  UserDatabase db = UserDatabase();
  final _myBox = Hive.box("User_Database");

  void readQuiz() {
    if (_myBox.get("miniQuizResult") == null) {
      db.initQuiz();
    } else {
      db.loadQuiz();
    }

    for (var question in quiz) {
      questions.add(question);
    }
  }

  @override
  void initState() {
    setState(() {
      readQuiz();
      _controller = PageController(
        initialPage: 0,
      );
    });

    super.initState();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: Column(
            children: [
              MyTopModuleTitle(
                  title: "Bloque 1 \nAumenta tu motivación",
                  letter: letter,
                  lightBackground: lightBackground),

              // INSTRUCTIONS
              MySimpleContainer(
                lightBackground: lightBackground,
                child: Text(
                  "Contesta las siguientes preguntas que serán para reflexionar sobre tus motivaciones y metas:",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: letter,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // QUIZ
              MySimpleContainer(
                lightBackground: lightBackground,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Pregunta $_questionNumber/${quiz.length}",
                      style: TextStyle(
                        color: letter,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: letter,
                    ),
                    SizedBox(
                      height: 280,
                      child: showQuiz(),
                    ),
                    enabledButton(),
                  ],
                ),
              ),

              // NOTE
              MySimpleContainer(
                lightBackground: lightBackground,
                child: Text(
                  "Nota: Esto no es una evaluación psicológica, no está validada como una herramienta de diagnóstico, solo son preguntas que permiten una reflexión.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: letter,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showQuiz() {
    return PageView.builder(
        controller: _controller,
        itemCount: quiz.length,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {});
        },
        itemBuilder: (context, index) {
          // MAGIC FOR SETSTATE XD
          SchedulerBinding.instance.addPostFrameCallback((_) {
            setState(() {});
          });

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questions[index].text,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.normal),
              ),
              Expanded(
                child: MyQuizRadioList(
                  question: questions[index],
                  back: back,
                  options: questions[index].options,
                  questionNumber: index,
                ),
              ),
            ],
          );
        });
  }

  Widget enabledButton() {
    if (db.miniQuizResult[_questionNumber - 1][0] != "") {
      setState(() {
        enabledNext = true;
      });
    }

    return MySimpleButton(
      enabled: enabledNext,
      onPressed: () {
        if (_questionNumber < quiz.length) {
          _controller!.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInExpo);

          setState(() {
            _questionNumber++;
            enabledNext = false;
          });
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const QuizResults()));
        }
      },
      txt: _questionNumber < quiz.length ? "Siguiente" : "Ver Resultado",
      back: back,
      txtColor: Colors.white,
      btnWidth: _questionNumber < quiz.length ? 110 : 150,
    );
  }
}
