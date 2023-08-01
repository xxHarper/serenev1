import 'package:serenev1/services/local_storage.dart';

class Question {
  final String text;
  final List<Option> options;

  String selectedOption;
  int selectedValue;

  Question(
      {required this.text,
      required this.options,
      this.selectedOption = "",
      this.selectedValue = 10});
}

class Option {
  final String text;
  int value;

  Option({required this.text, this.value = 10});
}

void saveAnswer(Question question, String option, String key) {
  question.selectedOption = option;
  LocalStorage.prefs.setString(key, option);
}

void saveValue(Question question, Option option, String key){
  question.selectedValue = option.value;
  LocalStorage.prefs.setInt(key, option.value);
}

final sociodemographic = [
  // CUESTIONARIO SOCIODEMOGRAFICO
  Question(text: "Lugar de residencia:", options: [
    Option(
      text: "Aguascalientes",
    ),
    Option(
      text: "Baja California",
    ),
    Option(
      text: "Baja California Sur",
    ),
    Option(
      text: "Campeche",
    ),
    Option(
      text: "Chiapas",
    ),
    Option(
      text: "Chihuahua",
    ),
    Option(
      text: "Ciudad de México",
    ),
    Option(
      text: "Coahuila",
    ),
    Option(
      text: "Colima",
    ),
    Option(
      text: "Durango",
    ),
    Option(
      text: "Estado de México",
    ),
    Option(
      text: "Guanajuato",
    ),
    Option(
      text: "Guerrero",
    ),
    Option(
      text: "Hidalgo",
    ),
    Option(
      text: "Jalisco",
    ),
    Option(
      text: "Michoacán",
    ),
    Option(
      text: "Morelos",
    ),
    Option(
      text: "Nayarit",
    ),
    Option(
      text: "Nuevo León",
    ),
    Option(
      text: "Oaxaca",
    ),
    Option(
      text: "Puebla",
    ),
    Option(
      text: "Querétaro",
    ),
    Option(
      text: "Quintana Roo",
    ),
    Option(
      text: "San Luis Potosí",
    ),
    Option(
      text: "Sinaloa",
    ),
    Option(
      text: "Sonora",
    ),
    Option(
      text: "Tabasco",
    ),
    Option(
      text: "Tamaulipas",
    ),
    Option(
      text: "Tlaxcala",
    ),
    Option(
      text: "Veracruz",
    ),
    Option(
      text: "Yucatán",
    ),
    Option(
      text: "Zacatecas",
    ),
    Option(
      text: "Extranjero",
    )
  ]),
  Question(
      text: "¿Actualmente está en tratamiento psicológico o psiquiátrico?",
      options: [
        Option(
          text: "Si",
        ),
        Option(
          text: "No",
        )
      ]),
  Question(
      text:
          "En caso de haber respondido Sí, ¿toma algún medicamento como parte de este tratamiento?",
      options: [
        Option(
          text: "Si",
        ),
        Option(
          text: "No",
        ),
        Option(
          text: "No Aplica",
        )
      ]),

  // 4. BAI
  Question(text: "Hormigueo o entumecimiento", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Sensación de calor", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Temblor en las piernas", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Incapacidad de relajarse", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Miedo a que suceda lo peor", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Mareo o aturdimiento", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Palpitaciones o taquicardia", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Sensación de inestabilidad e inseguridad física", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Terrores", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Nerviosismo", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Sensación de ahogo", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Temblores de manos", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Temblor generalizado o estremecimiento", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Miedo a perder el control", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Dificultad para respirar", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Miedo a morirse", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Sobresaltos", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Molestias digestivas o abdominales", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Palidez", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),
  Question(text: "Rubor facial", options: [
    Option(
      text: "No, en absoluto",
      value: 0,
    ),
    Option(
      text: "Levemente, no me molesta mucho",
      value: 1,
    ),
    Option(
      text: "Moderadamente, fue muy desagradable, pero podía soportarlo",
      value: 2,
    )
  ]),

  // 24. BDI-II
  Question(text: "Tristeza", options: [
    Option(
      text: "No me siento triste.",
      value: 0,
    ),
    Option(
      text: "Me siento triste la mayor parte del tiempo.",
      value: 1,
    ),
    Option(
      text: "Estoy triste todo el tiempo.",
      value: 2,
    ),
    Option(
      text: "Estoy tan triste o infeliz que no puedo soportarlo.",
      value: 3,
    )
  ]),
  Question(text: "Pesimismo", options: [
    Option(
      text: "No estoy desanimado(a) por mi futuro.",
      value: 0,
    ),
    Option(
      text: "Me siento más desanimado(a) por mi futuro que de costumbre.",
      value: 1,
    ),
    Option(
      text: "No espero que las cosas mejoren para mí.",
      value: 2,
    ),
    Option(
      text: "Siento que mi futuro es desalentador y puede empeorar.",
      value: 3,
    )
  ]),
  Question(text: "Fracasos del pasado", options: [
    Option(
      text: "No me siento un fracasado.",
      value: 0,
    ),
    Option(
      text: "He fracasado más de lo que debería.",
      value: 1,
    ),
    Option(
      text: "Cuando miro hacia atrás, veo muchos fracasos en mi vida.",
      value: 2,
    ),
    Option(
      text: "Siento que como persona soy un total fracaso.",
      value: 3,
    )
  ]),
  Question(text: "Pérdida del placer", options: [
    Option(
      text: "Obtengo el mismo placer de siempre por las cosas que disfruto.",
      value: 0,
    ),
    Option(
      text: "No disfruto las cosas tanto como antes.",
      value: 1,
    ),
    Option(
      text: "Obtengo muy poco placer de cosas que antes disfrutaba.",
      value: 2,
    ),
    Option(
      text: "No logro placer alguno de las cosas que solía disfrutar",
      value: 3,
    )
  ]),
  Question(text: "Sentimientos de culpa", options: [
    Option(
      text: "No me siento especialmente culpable.",
      value: 0,
    ),
    Option(
      text:
          "Me siento culpable por muchas cosas que he hecho o que debí haber hecho.",
      value: 1,
    ),
    Option(
      text: "Me siento bastante culpable la mayor parte del tiempo.",
      value: 2,
    ),
    Option(
      text: "Me siento culpable todo el tiempo.",
      value: 3,
    )
  ]),
  Question(text: "Sentimientos de castigo", options: [
    Option(
      text: "No siento que estoy siendo castigado(a).",
      value: 0,
    ),
    Option(
      text: "Siento que podría ser castigado(a).",
      value: 1,
    ),
    Option(
      text: "Espero ser castigado(a).",
      value: 2,
    ),
    Option(
      text: "Siento que estoy siendo castigado(a).",
      value: 3,
    )
  ]),
  Question(text: "Desagrado con uno mismo", options: [
    Option(
      text: "Me siento igual que siempre sobre mi persona.",
      value: 0,
    ),
    Option(
      text: "He perdido confianza en mí mismo.",
      value: 1,
    ),
    Option(
      text: "Me siento desilusionado de mí mismo.",
      value: 2,
    ),
    Option(
      text: "No me gusta como soy.",
      value: 3,
    )
  ]),
  Question(text: "Autocrítica", options: [
    Option(
      text: "No me critico ni me culpo más de lo debido.",
      value: 0,
    ),
    Option(
      text: "Soy más crítico de mi persona de lo que solía ser.",
      value: 1,
    ),
    Option(
      text: "Me autocritico por todas las faltas que cometo.",
      value: 2,
    ),
    Option(
      text: "Me culpo por todo lo malo que sucede.",
      value: 3,
    )
  ]),
  Question(text: "Ideación o deseos suicidas", options: [
    Option(
      text: "No tengo pensamientos suicidas.",
      value: 0,
    ),
    Option(
      text: "Tengo pensamientos suicidas, pero NO los llevaría a cabo.",
      value: 1,
    ),
    Option(
      text: "Me gustaría suicidarme.",
      value: 2,
    ),
    Option(
      text: "Me suicidaría si tuviera la oportunidad.",
      value: 3,
    )
  ]),
  Question(text: "Llanto", options: [
    Option(
      text: "No lloro más que antes.",
      value: 0,
    ),
    Option(
      text: "Lloro más de lo que acostumbraba.",
      value: 1,
    ),
    Option(
      text: "Lloro por cualquier cosa.",
      value: 2,
    ),
    Option(
      text: "Siento ganas de llorar pero NO puedo.",
      value: 3,
    )
  ]),
  Question(text: "Inquietud", options: [
    Option(
      text: "No estoy más inquieto(a) o agitado(a) que de costumbre.",
      value: 0,
    ),
    Option(
      text: "Me siento más inquieto(a) o agitado(a) que de costumbre.",
      value: 1,
    ),
    Option(
      text:
          "Estoy tan inquieto(a) o agitado(a) que me es difícil quedarme quieto.",
      value: 2,
    ),
    Option(
      text:
          "Estoy tan inquieto(a) o agitado(a) que tengo que estarme moviendo o haciendo algo.",
      value: 3,
    )
  ]),
  Question(text: "Pérdida del interés", options: [
    Option(
      text:
          "No he perdido el interés en otras personas ni en otras actividades.",
      value: 0,
    ),
    Option(
      text:
          "Estoy menos interesado en otras personas o en otras cosas que antes.",
      value: 1,
    ),
    Option(
      text:
          "He perdido casi todo el interés en otras personas y en otras cosas.",
      value: 2,
    ),
    Option(
      text: "Me resulta difícil interesarme por algo.",
      value: 3,
    )
  ]),
  Question(text: "Indecisión", options: [
    Option(
      text: "Tomo decisiones igual que siempre.",
      value: 0,
    ),
    Option(
      text: "Encuentro más difícil tomar decisiones que antes.",
      value: 1,
    ),
    Option(
      text: "Tengo mucha más dificultad para tomar decisiones que antes.",
      value: 2,
    ),
    Option(
      text: "Tengo problemas para tomar cualquier decisión.",
      value: 3,
    )
  ]),
  Question(text: "Inutilidad", options: [
    Option(
      text: "No siento que sea un inútil.",
      value: 0,
    ),
    Option(
      text: "No me considero tan útil como antes.",
      value: 1,
    ),
    Option(
      text: "Me siento más inútil comparado con otras personas.",
      value: 2,
    ),
    Option(
      text: "Me siento totalmente inútil.",
      value: 3,
    )
  ]),
  Question(text: "Pérdida de energía", options: [
    Option(
      text: "Tengo la misma energía de siempre.",
      value: 0,
    ),
    Option(
      text: "Tengo menos energía de la que tenía antes.",
      value: 1,
    ),
    Option(
      text: "No tengo la energía suficiente para hacer muchas cosas.",
      value: 2,
    ),
    Option(
      text: "No tengo suficiente energía para hacer cualquier cosa.",
      value: 3,
    )
  ]),
  Question(text: "Cambios en los patrones de sueño", options: [
    Option(
      text: "Mis patrones de sueño NO han cambiado",
      value: 0,
    ),
    Option(
      text: "Duermo un poco más que de costumbre",
      value: 1,
    ),
    Option(
      text: "Duermo un poco menos que de costumbre",
      value: 1,
    ),
    Option(
      text: "Duermo mucho más que de costumbre",
      value: 2,
    ),
    Option(
      text: "Duermo mucho menos que de costumbre",
      value: 2,
    ),
    Option(
      text: "Duermo la mayor parte del día",
      value: 3,
    ),
    Option(
      text:
          "Me despierto 1 o 2 horas más temprano y No me puedo volver a dormir",
      value: 3,
    )
  ]),
  Question(text: "Irritabilidad", options: [
    Option(
      text: "No estoy más irritable que de costumbre.",
      value: 0,
    ),
    Option(
      text: "Estoy más irritable que de costumbre.",
      value: 1,
    ),
    Option(
      text: "Estoy mucho más irritable que de costumbre.",
      value: 2,
    ),
    Option(
      text: "Estoy irritable todo el tiempo.",
      value: 3,
    )
  ]),
  Question(text: "Cambios en hábitos alimentarios", options: [
    Option(
      text: "Mis hábitos alimentarios no han cambiado.",
      value: 0,
    ),
    Option(
      text: "Mi apetito es menor que de costumbre.",
      value: 1,
    ),
    Option(
      text: "Mi apetito es mayor que de costumbre.",
      value: 1,
    ),
    Option(
      text: "Tengo mucha menos hambre de la que tenía antes.",
      value: 2,
    ),
    Option(
      text: "Tengo mucha más hambre de la que tenía antes.",
      value: 2,
    ),
    Option(
      text: "Tengo completa falta de apetito.",
      value: 3,
    ),
    Option(
      text: "Tengo la necesidad de estar comiendo todo el día.",
      value: 3,
    )
  ]),
  Question(text: "Dificultad para concentrarse", options: [
    Option(
      text: "Me puedo concentrar tan bien como antes.",
      value: 0,
    ),
    Option(
      text: "No me puedo concentrar tan bien como antes.",
      value: 1,
    ),
    Option(
      text: "Se me dificulta pensar en cualquier cosa por mucho tiempo.",
      value: 2,
    ),
    Option(
      text: "Me he dado cuenta que ya No me puedo concentrar",
      value: 3,
    )
  ]),
  Question(text: "Cansancio o fatiga", options: [
    Option(
      text: "No estoy más cansado(a) o fatigado(a) que de costumbre.",
      value: 0,
    ),
    Option(
      text: "Me canso o fatigo con más facilidad que de costumbre.",
      value: 1,
    ),
    Option(
      text:
          "Estoy tan cansado(a) o fatigado(a) que no puedo hacer lo que solía hacer.",
      value: 2,
    ),
    Option(
      text:
          "Estoy muy cansado(a) o fatigado(a) para hacer la mayoría de las cosas que solía hacer.",
      value: 3,
    )
  ]),
  Question(text: "Pérdida de interés en el sexo", options: [
    Option(
      text:
          "No he notado recientemente algún cambio en mi interés por el sexo.",
      value: 0,
    ),
    Option(
      text: "Estoy menos interesado(a) en el sexo que de costumbre.",
      value: 1,
    ),
    Option(
      text: "El sexo me interesa mucho menos que antes.",
      value: 2,
    ),
    Option(
      text: "He perdido el interés por el sexo completamente.",
      value: 3,
    )
  ]),

  // 45. MINI
  Question(
      text: "¿Ha pensado que sería mejor morirse o ha deseado estar muerto(a)?",
      options: [
        Option(
          text: "No",
        ),
        Option(
          text: "SI",
        ),
      ]),
  Question(text: "¿Ha querido hacerse daño?", options: [
    Option(
      text: "No",
    ),
    Option(
      text: "SI",
    ),
  ]),
  Question(text: "¿Ha pensado en el suicidio?", options: [
    Option(
      text: "No",
    ),
    Option(
      text: "SI",
    ),
  ]),
  Question(text: "¿Ha planeado suicidarse?", options: [
    Option(
      text: "No",
    ),
    Option(
      text: "SI",
    ),
  ]),
  Question(text: "¿Ha intentado suicidarse?", options: [
    Option(
      text: "No",
    ),
    Option(
      text: "SI",
    ),
  ]),
  Question(text: "¿Alguna vez ha intentado suicidarse?", options: [
    Option(
      text: "No",
    ),
    Option(
      text: "SI",
    ),
  ]),
];
