import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Question {
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question(
      {required this.text,
      required this.options,
      this.isLocked = false,
      this.selectedOption});
}

class Option {
  final String text;
  /* final bool isCorrect; */

  /* const Option({required this.text, required this.isCorrect}); */
  const Option({required this.text});
}

/* final questions = [
  Question(text: "HOLA", options: [
    const Option(text: "Adios", isCorrect: true),
    const Option(text: "Adios2", isCorrect: false)
  ]),
  Question(text: "ADIOS", options: [
    const Option(text: "Hola", isCorrect: false),
    const Option(text: "Hola2", isCorrect: true)
  ]),
]; */