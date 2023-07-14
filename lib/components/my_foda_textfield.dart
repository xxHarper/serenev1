import 'package:flutter/material.dart';

class MyFodaTextfield extends StatefulWidget {
  final Function(String)? onSubmitted;
  TextEditingController textController;
  final List<String> list;
  final String hint;
  final Color back;
  final Color lightBackground;
  final Color letter;
  final Color border;

  MyFodaTextfield(
      {Key? key,
      required this.onSubmitted,
      required this.textController,
      required this.list,
      required this.hint,
      required this.back,
      required this.lightBackground,
      required this.letter,
      required this.border})
      : super(key: key);

  @override
  _MyFodaTextfieldState createState() => _MyFodaTextfieldState();
}

class _MyFodaTextfieldState extends State<MyFodaTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: widget.lightBackground,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        child: TextField(
          controller: widget.textController,
          onSubmitted: widget.onSubmitted,
          style: TextStyle(
            color: widget.letter,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          cursorColor: widget.back,
          decoration: InputDecoration(
            prefixIconColor: widget.back,
            prefixIcon: const Icon(Icons.add_task),
            iconColor: widget.back,
            hintStyle: TextStyle(
              color: widget.letter,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
            hintText: widget.hint,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(width: 2, color: widget.border)),
            /* enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.redAccent)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))), */
          ),
        ));
  }
}
