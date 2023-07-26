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

  const Option({
    required this.text,
  });
}

final questions = [
  Question(text: "Lugar de residencia:", options: [
    const Option(
      text: "Adios",
    ),
    const Option(
      text: "Adios2",
    )
  ]),
  Question(
      text: "¿Actualmente está en tratamiento psicológico o psiquiátrico?:",
      options: [
        const Option(
          text: "Si",
        ),
        const Option(
          text: "No",
        )
      ]),
  Question(
      text:
          "En caso de haber respondido Sí, ¿toma algún medicamento como parte de este tratamiento?",
      options: [
        const Option(
          text: "Si",
        ),
        const Option(
          text: "No",
        ),
        const Option(
          text: "No Aplica",
        )
      ]),
];
