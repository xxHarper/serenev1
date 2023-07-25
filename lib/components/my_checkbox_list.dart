import 'package:flutter/material.dart';
import 'package:serenev1/services/local_storage.dart';

class CheckboxList extends StatefulWidget {
  bool checkboxValue;
  final String txt;
  final Color back;
  final String localName;
  final bool enabled;

  CheckboxList({
    Key? key,
    required this.checkboxValue,
    this.localName = "",
    required this.txt,
    required this.back,
    this.enabled = false,
  }) : super(key: key);

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
      onChanged: widget.enabled
          ? null
          : (bool? value) {
              setState(() {
                widget.checkboxValue = value!;
                LocalStorage.prefs.setBool(widget.localName, value);
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
