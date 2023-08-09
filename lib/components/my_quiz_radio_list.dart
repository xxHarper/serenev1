import 'package:flutter/material.dart';

import '../data/user_database.dart';
import '../models/pre_assessment.dart';

class MyQuizRadioList extends StatefulWidget {
  final Question question;
  final List<Option> options;
  final Color back;
  final int questionNumber;

  const MyQuizRadioList({
    Key? key,
    required this.question,
    required this.options,
    required this.back,
    required this.questionNumber,
  }) : super(key: key);

  @override
  _MyQuizRadioListState createState() => _MyQuizRadioListState();
}

class _MyQuizRadioListState extends State<MyQuizRadioList> {
  UserDatabase db = UserDatabase();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.options.length,
      itemBuilder: (BuildContext context, int index) {
        db.loadQuiz();

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.greenAccent.shade100, width: 2)),
          child: RadioListTile(
            activeColor: widget.back,
            title: Text(
              widget.options[index].value == 10
                  ? widget.options[index].text
                  : "(${widget.options[index].value}) ${widget.options[index].text}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            value: widget.options[index].text,
            groupValue: db.miniQuizResult[widget.questionNumber][0].toString(),
            onChanged: (String? value) {
              setState(() {
                db.updateQuiz(widget.questionNumber, value!,
                    widget.options[index].reflection);
              });
            },
          ),
        );
      },
    );
  }
}
