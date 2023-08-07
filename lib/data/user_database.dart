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
  // user xd
  List strenghts = [];

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
}
