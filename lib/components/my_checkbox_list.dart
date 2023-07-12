import 'package:flutter/material.dart';

class CheckboxList extends StatefulWidget {
  bool checkboxValue;
  final String txt;
  final Color back;
  CheckboxList(
      {Key? key,
      required this.checkboxValue,
      required this.txt,
      required this.back})
      : super(key: key);

  @override
  _CheckboxListState createState() => _CheckboxListState();
}

class _CheckboxListState extends State<CheckboxList> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      checkColor: Colors.white,
      activeColor: widget.back,
      controlAffinity: ListTileControlAffinity.leading,
      value: widget.checkboxValue,
      onChanged: (bool? value) {
        setState(() {
          widget.checkboxValue = value!;
        });
      },
      title: Text(
        widget.txt,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      /* subtitle: const Text('Supporting text'), */
    );
  }
}
