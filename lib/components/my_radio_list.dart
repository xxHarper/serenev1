import 'package:flutter/material.dart';
import 'package:serenev1/models/pre_assessment.dart';

import '../services/local_storage.dart';

class MyRadioList extends StatefulWidget {
  final Question question;
  final List<Option> options;
  /* final List<String> answers; */
  final Color back;
  /* final int questionNumber; */
  final String questionKey;

  const MyRadioList(
      {Key? key,
      required this.question,
      required this.options,
      /* required this.answers, */
      required this.back,
      /* required this.questionNumber, */
      required this.questionKey})
      : super(key: key);

  @override
  _MyRadioListState createState() => _MyRadioListState();
}

class _MyRadioListState extends State<MyRadioList> {
  final List<String> answers =
      LocalStorage.prefs.getStringList("answers") ?? [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.options.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.pink.shade100, width: 2)),
          child: RadioListTile(
            activeColor: widget.back,
            title: Text(
              widget.options[index].value == 10
                  ? widget.options[index].text
                  : "(${widget.options[index].value}) ${widget.options[index].text}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            value: widget.options[index].text,
            groupValue: widget.question.selectedOption,
            onChanged: (String? value) {
              setState(() {
                saveAnswer(widget.question, value!, widget.questionKey);
              });
            },
          ),
        );
      },
    );
  }
}
