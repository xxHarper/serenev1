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
  final bool isCorrect;

  const Option({required this.text, required this.isCorrect});
}

final questions = [
  Question(text: "HOLA", options: [
    const Option(text: "Adios", isCorrect: true),
    const Option(text: "Adios2", isCorrect: false)
  ]),

  Question(text: "ADIOS", options: [
    const Option(text: "Hola", isCorrect: false),
    const Option(text: "Hola2", isCorrect: true)
  ]),
];
