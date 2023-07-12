import 'package:flutter/material.dart';
import 'package:serenev1/models/question_model.dart';

class OptionWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClikedOption;
  const OptionWidget(
      {Key? key, required this.question, required this.onClikedOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: question.options
            .map((option) => buildOption(context, option))
            .toList(),
      ),
    );
  }

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, question);
    return GestureDetector(
      onTap: () => onClikedOption(option),
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            /* border: Border.all(color: Colors.grey)), */
            border: Border.all(color: color)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Text(
                option.text,
                style: const TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;

    if (question.isLocked) {
      if (isSelected) {
        /* return option.isCorrect ? Colors.green : Colors.red; */
        return Colors.greenAccent;
      } /* else if (option.isCorrect) {
        return Colors.green;
      } */
    }

    return Colors.grey.shade300;
  }
}
