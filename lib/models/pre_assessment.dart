import 'package:serenev1/services/local_storage.dart';

class Question {
  final String text;
  final List<Option> options;

  String selectedOption;

  Question(
      {required this.text, required this.options, this.selectedOption = ""});
}

class Option {
  final String text;

  const Option({
    required this.text,
  });
}

void saveAnswer(Question question, String option, String key) {
  question.selectedOption = option;
  LocalStorage.prefs.setString(key, option);
}

final sociodemographic = [
  Question(text: "Lugar de residencia:", options: [
    const Option(
      text: "Aguascalientes",
    ),
    const Option(
      text: "Baja California",
    ),
    const Option(
      text: "Baja California Sur",
    ),
    const Option(
      text: "Campeche",
    ),
    const Option(
      text: "Chiapas",
    ),
    const Option(
      text: "Chihuahua",
    ),
    const Option(
      text: "Ciudad de México",
    ),
    const Option(
      text: "Coahuila",
    ),
    const Option(
      text: "Colima",
    ),
    const Option(
      text: "Durango",
    ),
    const Option(
      text: "Estado de México",
    ),
    const Option(
      text: "Guanajuato",
    ),
    const Option(
      text: "Guerrero",
    ),
    const Option(
      text: "Hidalgo",
    ),
    const Option(
      text: "Jalisco",
    ),
    const Option(
      text: "Michoacán",
    ),
    const Option(
      text: "Morelos",
    ),
    const Option(
      text: "Nayarit",
    ),
    const Option(
      text: "Nuevo León",
    ),
    const Option(
      text: "Oaxaca",
    ),
    const Option(
      text: "Puebla",
    ),
    const Option(
      text: "Querétaro",
    ),
    const Option(
      text: "Quintana Roo",
    ),
    const Option(
      text: "San Luis Potosí",
    ),
    const Option(
      text: "Sinaloa",
    ),
    const Option(
      text: "Sonora",
    ),
    const Option(
      text: "Tabasco",
    ),
    const Option(
      text: "Tamaulipas",
    ),
    const Option(
      text: "Tlaxcala",
    ),
    const Option(
      text: "Veracruz",
    ),
    const Option(
      text: "Yucatán",
    ),
    const Option(
      text: "Zacatecas",
    ),
    const Option(
      text: "Extranjero",
    )
  ]),
  Question(
      text: "¿Actualmente está en tratamiento psicológico o psiquiátrico?",
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
