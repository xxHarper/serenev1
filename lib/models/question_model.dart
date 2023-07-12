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

final quiz = [
  Question(text: "¿Con qué frecuencia piensas en tus metas?", options: [
    const Option(text: "Nunca"),
    const Option(text: "Ocasionalmente"),
    const Option(text: "Frecuentemente")
  ]),
  Question(text: "¿Consideras que tus metas son realistas?", options: [
    const Option(text: "En absoluto"),
    const Option(text: "Algunas veces"),
    const Option(text: "Totalmente")
  ]),
  Question(text: "¿Con qué frecuencia logras las metas que te propones?", options: [
    const Option(text: "Rara vez o nunca"),
    const Option(text: "Algunas veces"),
    const Option(text: "La mayoría de las veces")
  ]),
  Question(text: "¿Qué tan satisfecho(a) te sientes con tus logros actuales?", options: [
    const Option(text: "Insatisfecho(a)"),
    const Option(text: "Neutral"),
    const Option(text: "Muy satisfecho(a)")
  ]),
  Question(text: "¿Qué tan motivada(o) estás para alcanzar tus metas?", options: [
    const Option(text: "Sin motivación"),
    const Option(text: "Moderadamente motivado(a)"),
    const Option(text: "Muy motivado(a)")
  ]),
];