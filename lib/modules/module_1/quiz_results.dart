import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:serenev1/components/my_simple_app_bar.dart';
import 'package:serenev1/components/my_simple_button.dart';
import 'package:serenev1/components/my_simple_container.dart';
import 'package:serenev1/components/my_top_module_title.dart';
import 'package:serenev1/modules/module_1/video.dart';

import '../../data/user_database.dart';
import '../../models/mini_quiz_model.dart';
import '../../models/pre_assessment.dart';

class QuizResults extends StatefulWidget {
  const QuizResults({Key? key}) : super(key: key);

  @override
  State<QuizResults> createState() => _QuizResultsState();
}

class _QuizResultsState extends State<QuizResults> {
  final Color letter = const Color(0XFF3A907A);
  final Color lightBackground = const Color(0XFFE2FFF7);
  final Color back = const Color(0xff42BF9F);

  UserDatabase db = UserDatabase();
  List<Question> questions = [];
  PageController? _controller;
  int _questionNumber = 1;

  void readQuiz() {
    for (var question in quiz) {
      questions.add(question);
    }
  }

  @override
  void initState() {
    setState(() {
      db.loadQuiz();
      readQuiz();
      _controller = PageController(
        initialPage: 0,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MySimpleAppBar(back: back, lightBackground: lightBackground),
      backgroundColor: back,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Column(
          children: [
            // Titulo
            MyTopModuleTitle(
                title: "Bloque 1 \nAumenta tu motivación",
                letter: letter,
                lightBackground: lightBackground),

            // INSTRUCTIONS
            MySimpleContainer(
                lightBackground: lightBackground,
                child: Text(
                  "Resultados del QUIZ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25, color: letter, fontWeight: FontWeight.bold),
                )),

            // QUIZ
            Expanded(
              child: MySimpleContainer(
                  lightBackground: lightBackground,
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: _controller,
                          physics: const NeverScrollableScrollPhysics(),
                          onPageChanged: (index) {
                            setState(() {});
                          },
                          itemCount: db.miniQuizResult.length,
                          itemBuilder: (context, index) {
                            // MAGIC FOR SETSTATE XD
                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              setState(() {});
                            });

                            // List of each question
                            return ListView.builder(
                                itemCount: 1,
                                itemBuilder:
                                    (BuildContext context, int indexx) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Questions
                                      RichText(
                                        text: TextSpan(
                                          text: "${index + 1}.  ",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 24,
                                              color: Colors.black87),
                                          children: [
                                            // Question text
                                            TextSpan(
                                              text: questions[index].text,
                                              style: TextStyle(color: letter),
                                            )
                                          ],
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // Answers
                                      RichText(
                                        text: TextSpan(
                                          text: "Tu respuesta: ",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black87,
                                              fontSize: 24),
                                          children: [
                                            TextSpan(
                                                text:
                                                    "${db.miniQuizResult[index][0]}",
                                                style: TextStyle(
                                                    color: letter,
                                                    fontWeight:
                                                        FontWeight.normal))
                                          ],
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 20,
                                      ),

                                      // Reflection
                                      RichText(
                                        text: TextSpan(
                                          text: "Reflexionemos... ",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                              fontSize: 24),
                                          children: [
                                            TextSpan(
                                                text:
                                                    "${db.miniQuizResult[index][1]}",
                                                style: TextStyle(color: letter))
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                        ),
                      ),

                      // Next Button
                      MySimpleButton(
                        onPressed: () {
                          if (_questionNumber < questions.length) {
                            _controller!.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInExpo);

                            setState(() {
                              _questionNumber++;
                            });
                          } else {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Video()));
                          }
                        },
                        txt: _questionNumber < questions.length
                            ? "Siguiente"
                            : "Terminar",
                        back: back,
                        txtColor: Colors.white,
                        btnWidth: 110,
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
