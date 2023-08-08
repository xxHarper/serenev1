import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {
  final controller;
  final String hintText;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final Color lightBackground;
  final Color buttonColor;
  final Color letter;

  const MyAlertBox(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.onSave,
      required this.onCancel,
      required this.lightBackground,
      required this.letter,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: lightBackground,
      content: TextField(
        controller: controller,
        style: TextStyle(color: letter, fontSize: 18),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: buttonColor)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: buttonColor)),
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: onSave,
          color: buttonColor,
          child: const Text(
            "Guardar",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        MaterialButton(
          onPressed: onCancel,
          color: buttonColor,
          child: const Text(
            "Cancelar",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
