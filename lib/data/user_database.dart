import 'package:hive_flutter/hive_flutter.dart';
import 'package:serenev1/models/pre_assessment.dart';

// Reference our box/database
final _myBox = Hive.box("User_Database");

// general user class
class UserDatabase {
  // For the pre-evaluation
  List selectedAnswers = [];
  // Objetives for module1
  List objetivesModule1 = [];
  // User strenghts from swot (FODA)
  List swotStrenghts = [];
  // User weaknesses from swot (FODA)
  List swotWeaknesses = [];
  // User threads from swot (FODA)
  List swotThreads = [];
  // User opportunities from swot (FODA)
  List swotOpportunities = [];

  // Initialize de selectedAnswers list for the first time
  // it means, empty String because of option.text and the int value
  void initSelectedANswers() {
    for (var question in sociodemographic) {
      // A tuple, "" for the String of the selectedOption and int
      // for the value just in case....
      selectedAnswers.add(["", 50]);
    }

    _myBox.put("selectedAnswers", selectedAnswers);
  }

  // Load saved answers
  void loadSelectedAnswers() {
    selectedAnswers = _myBox.get("selectedAnswers");
  }

  // Receive an index for the item to update
  void updateSelectedAnswers(int index, String selectedOption, int value) {
    selectedAnswers[index][0] = selectedOption;
    selectedAnswers[index][1] = value;

    _myBox.put("selectedAnswers", selectedAnswers);
  }

  // Initialize de objetives list for the first time
  // they're chebox so we need the text and the bool
  void initObjetives() {
    objetivesModule1.add([
      "Aprender técnicas de relajación para reducir el estrés de manera efectiva.",
      false
    ]);

    objetivesModule1.add([
      "Mejorar la habilidad de comunicación interpersonal para establecer relaciones más saludables y satisfactorias.",
      false
    ]);

    objetivesModule1.add([
      "Optimizar la calidad y duración de mi descanso para mejorar mi bienestar general.",
      false
    ]);

    objetivesModule1.add([
      "Desarrollar habilidades para manejar y regular mis emociones de forma saludable y equilibrada.",
      false
    ]);

    objetivesModule1
        .add(["Fortalecer mi autoestima y confianza personal.", false]);

    objetivesModule1.add([
      "Implementar estrategias efectivas para gestionar conflictos de manera constructiva.",
      false
    ]);

    objetivesModule1.add([
      "Incorporar regularmente técnicas de mindfulness para aumentar la conciencia plena.",
      false
    ]);

    objetivesModule1.add(
        ["Adoptar hábitos que promuevan mi bienestar físico y mental.", false]);

    objetivesModule1.add([
      "Desarrollar la capacidad de adaptación y flexibilidad ante situaciones cambiantes.",
      false
    ]);

    objetivesModule1.add([
      "Aprender a establecer límites personales de manera clara y asertiva.",
      false
    ]);

    objetivesModule1.add([
      "Ampliar mi autoconocimiento para comprender mejor mis necesidades emocionales y satisfacerlas.",
      false
    ]);

    objetivesModule1.add([
      "Mejorar mi habilidad para administrar el tiempo de manera eficiente y evitar la procrastinación.",
      false
    ]);

    objetivesModule1.add([
      "Promover la participación en actividades que incrementen mi bienestar emocional y disfrute personal.",
      false
    ]);

    _myBox.put("objetivesModule1", objetivesModule1);
  }

  // Load the saved objetives
  void loadObjetives() {
    objetivesModule1 = _myBox.get("objetivesModule1");
  }

  // Update the objetives, selected or not
  void updateObjetives(int index, bool value) {
    objetivesModule1[index][1] = value;
    _myBox.put("objetivesModule1", objetivesModule1);
  }

  // init the STRENGHTS list with default data
  void initStrenghts() {
    swotStrenghts.add(["Sabiduría y conocimiento", false]);
    swotStrenghts.add(["Curiosidad / Interés en el mundo", false]);
    swotStrenghts
        .add(["Juicio / Pensamiento crítico / Apertura mental", false]);
    swotStrenghts.add(
        ["Ingenio / Originalidad / Inteligencia práctica / Espabilado", false]);
    swotStrenghts.add([
      "Inteligencia social / Inteligencia personal / Inteligencia emocional",
      false
    ]);
    swotStrenghts.add(["Perspectiva / Valor / Perseverancia", false]);
    swotStrenghts.add(["Valor y bravura", false]);
    swotStrenghts.add([
      "Perseverancia / Laboriosidad / DiligenciaPerseverancia / Laboriosidad / Diligencia",
      false
    ]);
    swotStrenghts.add(["Integridad / Autenticidad / Honestidad", false]);
    swotStrenghts.add(["Amabilidad y generosidad", false]);
    swotStrenghts.add(["Amar y permitirse ser amado", false]);
    swotStrenghts
        .add(["Ciudadanía / Deber / Trabajo en equipo / Lealtad", false]);
    swotStrenghts.add(["Imparcialidad e igualdad", false]);
    swotStrenghts.add(["Liderazgo", false]);
    swotStrenghts.add(["Autocontrol", false]);
    swotStrenghts.add(["Prudencia / Discreción / Cautela", false]);
    swotStrenghts.add(["Humildad y modestia", false]);
    swotStrenghts.add(["Aprecio por la belleza y la excelencia", false]);
    swotStrenghts.add(["Gratitud", false]);
    swotStrenghts.add(
        ["Esperanza / Optimismo / Pensamiento orientado al futuro", false]);
    swotStrenghts
        .add(["Espiritualidad / Sentido de propósito / Religiosidad", false]);
    swotStrenghts.add(["Perdón y piedad", false]);
    swotStrenghts.add(["Jocosidad y humor", false]);
    swotStrenghts.add(["Vivacidad / Pasión / Entusiasmo", false]);

    _myBox.put("swotStrenghts", swotStrenghts);
  }

  // load the saved STRENGHTS
  void loadStrenghts() {
    swotStrenghts = _myBox.get("swotStrenghts");
  }

  // update the STRENGHTS list, new, edit, delet
  void updateStrenghts() {
    _myBox.put("swotStrenghts", swotStrenghts);
  }

  // init the WEAKNESSES list with default data
  void initWeaknesses() {
    swotWeaknesses.add(["Ignorancia / Desconocimiento", false]);
    swotWeaknesses.add(["Desinterés / Apatía", false]);
    swotWeaknesses.add(["Desatino / Sinrazón", false]);
    swotWeaknesses.add(["Incapacidad / Torpeza", false]);
    swotWeaknesses.add([
      "Ineptitud social / Estupidez personal / Desavenencia emocional",
      false
    ]);
    swotWeaknesses.add(["Ineficacia / Inutilidad / Negligencia", false]);
    swotWeaknesses.add(["Cobardía / Vergüenza", false]);
    swotWeaknesses.add(["Negligencia / Desidia", false]);
    swotWeaknesses.add(["Podredumbre / Deshonestidad", false]);
    swotWeaknesses.add(["Mezquindad / Codicia", false]);
    swotWeaknesses.add(["Odio / Aborrecer", false]);
    swotWeaknesses.add(["Traición / Desvergüenza", false]);
    swotWeaknesses.add(["Injusticia / Parcialidad", false]);
    swotWeaknesses.add([
      "Carencia de dirección, organización, autoridad, dominio de grupo",
      false
    ]);
    swotWeaknesses.add(["Descontrol / Descuido", false]);
    swotWeaknesses.add(["Osadía / Ligereza", false]);
    swotWeaknesses.add(["Soberbia / Arrogancia", false]);
    swotWeaknesses.add(["Aprecio por la fealdad y antiestética", false]);
    swotWeaknesses.add(["Ingratitud / Deslealtad", false]);
    swotWeaknesses.add(["Desesperanza / Desaliento / Pesimismo", false]);
    swotWeaknesses.add(["Materialismo / Agnosticismo", false]);
    swotWeaknesses.add(["Castigo / Crueldad / Severidad", false]);
    swotWeaknesses.add(["Seriedad / disgusto", false]);
    swotWeaknesses.add(["Desaliento / Tibieza", false]);

    _myBox.put("swotWeaknesses", swotWeaknesses);
  }

  // load the saved WEAKNESSES
  void loadWeaknesses() {
    swotWeaknesses = _myBox.get("swotWeaknesses");
  }

  // update the WEAKNESSES list, new, edit, delet
  void updateWeaknesses() {
    _myBox.put("swotWeaknesses", swotWeaknesses);
  }

  // init the THREAD list with default data
  void initThreads() {
    swotThreads.add([
      "Falta de apoyo familiar y social (educación, psicoemocional, comunicación, económico, nutricional, salud, seguridad, situación ambiental, entretenimiento, cultural, tecnológico)",
      false
    ]);
    swotThreads.add([
      "Falta de apoyo del gobierno (educación, trabajo, vivienda, económico, comunicación, servicios salud y seguridad, situación ambiental, entretenimiento, psicosocial, cultural, tecnológico)",
      false
    ]);
    swotThreads.add([
      "Falta de apoyo institucional (educación, trabajo, vivienda, económico, comunicación, servicios salud y seguridad, situación ambiental, entretenimiento, psicosocial, cultural, tecnológico)",
      false
    ]);
    swotThreads.add(
        ["Falta de prevención de accidentes y desastres naturales", false]);

    _myBox.put("swotThreads", swotThreads);
  }

  // load the saved THREADS
  void loadThreads() {
    swotThreads = _myBox.get("swotThreads");
  }

  // update the THREADS list, new, edit, delet
  void updateThreads() {
    _myBox.put("swotThreads", swotThreads);
  }

  // init the OPPORTUNITITES list with default data
  void initOpportunities() {
    swotOpportunities.add([
      "Apoyo familiar y social (educación, psicoemocional, comunicación, económico, nutricional, salud, seguridad, situación ambiental, entretenimiento, cultural, tecnológico)",
      false
    ]);
    swotOpportunities.add([
      "Apoyo del gobierno (educación, trabajo, vivienda, económico, comunicación, servicios salud y seguridad, situación ambiental, entretenimiento, psicosocial, cultural, tecnológico)",
      false
    ]);
    swotOpportunities.add([
      "Apoyo institucional (educación, trabajo, vivienda, económico, comunicación, servicios salud y seguridad, situación ambiental, entretenimiento, psicosocial, cultural, tecnológico)",
      false
    ]);
    swotOpportunities
        .add(["Prevención de accidentes y desastres naturales", false]);

    _myBox.put("swotOpportunities", swotOpportunities);
  }

  // load the saved OPPORTUNITIES
  void loadOpportunities() {
    swotOpportunities = _myBox.get("swotOpportunities");
  }

  // update the OPPORTUNITIES list, new, edit, delet
  void updateOpportunities() {
    _myBox.put("swotOpportunities", swotOpportunities);
  }
}
