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
}
