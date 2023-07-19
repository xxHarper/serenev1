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
  final String reflection;
  /* final bool isCorrect; */

  /* const Option({required this.text, required this.isCorrect}); */
  const Option({required this.text, required this.reflection});
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
    const Option(
        text: "Nunca",
        reflection:
            "Parece que actualmente no dedicas mucho tiempo a pensar en tus metas. Quizás sería útil dedicar algún tiempo para reflexionar sobre ellas. En este bloque conocerás la importancia de hacerlo."),
    const Option(
        text: "Ocasionalmente",
        reflection:
            "Es bueno que de vez en cuando pienses en tus metas. Recuerda que mantenerlas presentes en tu mente te ayudará a mantenerte enfocado(a) y motivado(a) para lograrlas. En este bloque conocerás la importancia de hacerlo."),
    const Option(
        text: "Frecuentemente",
        reflection:
            "¡Excelente! Pensar con frecuencia en tus metas demuestra tu compromiso y determinación. Continúa manteniéndolas en mente y trabajando hacia su consecución. En este bloque conocerás la importancia de hacerlo y podrás continuar con esta actividad.")
  ]),
  Question(text: "¿Consideras que tus metas son realistas?", options: [
    const Option(
        text: "En absoluto",
        reflection:
            "Establecer metas realistas te brinda una mayor probabilidad de éxito y te ayuda a mantenerte motivado(a). En este bloque trabajaremos en cómo hacer una meta más realista."),
    const Option(
        text: "Algunas veces",
        reflection:
            "¡Muy bien! Si algunas de tus metas son realista es muy importante, ahora trabajaremos en las otras que no lo son tanto."),
    const Option(
        text: "Totalmente",
        reflection:
            "¡Genial! Tener metas realistas es fundamental para mantener la motivación y lograr el éxito. Continúa trabajando hacia tus metas con confianza y refuerza tus conocimientos en este bloque.")
  ]),
  Question(
      text: "¿Con qué frecuencia logras las metas que te propones?",
      options: [
        const Option(
            text: "Rara vez o nunca",
            reflection:
                "Si te resulta difícil lograr tus metas con frecuencia, podría ser útil analizar qué está pasando. En este bloque lo revisaremos."),
        const Option(
            text: "Algunas veces",
            reflection:
                "Lograr metas algunas veces es un buen indicador de que estás en el camino correcto. Aquí vamos a revisar algunas cosas que podrán ayudarte aún más."),
        const Option(
            text: "La mayoría de las veces",
            reflection:
                "¡Felicidades! Lograr tus metas la mayoría de las veces es un gran logro. Sigue aprovechando ese impulso y confianza en ti mismo y complementa tus conocimientos aquí.")
      ]),
  Question(
      text: "¿Qué tan satisfecho(a) te sientes con tus logros actuales?",
      options: [
        const Option(
            text: "Insatisfecho(a)",
            reflection:
                "Si te sientes insatisfecho(a) con tus logros actuales, es una oportunidad para reflexionar sobre tus metas y el progreso que has hecho. En este bloque podremos trabajar en ello."),
        const Option(
            text: "Neutral",
            reflection:
                "Sentirse neutral con respecto a tus logros actuales puede ser un punto de partida para el crecimiento y el desarrollo personal.  En este bloque podremos trabajar en ello."),
        const Option(
            text: "Muy satisfecho(a)",
            reflection:
                "¡Fantástico! Sentirse muy satisfecho(a) con tus logros actuales es un gran indicador de éxito. Aprovecha este impulso positivo y sigue trabajando en este bloque en ello.")
      ]),
  Question(
      text: "¿Qué tan motivada(o) estás para alcanzar tus metas?",
      options: [
        const Option(
            text: "Sin motivación",
            reflection:
                "Si te encuentras sin motivación para alcanzar tus metas, es importante explorar las razones detrás de ello. En este bloque podremos trabajar juntos."),
        const Option(
            text: "Moderadamente motivado(a)",
            reflection:
                "Estar moderadamente motivado(a) es un buen punto de partida. En este bloque podremos trabajar en juntos."),
        const Option(
            text: "Muy motivado(a)",
            reflection:
                "¡Felicidades! Lograr tus metas la mayoría de las veces es un gran logro. Sigue aprovechando ese impulso y confianza en ti mismo y complementa tus conocimientos aquí.")
      ]),
];
