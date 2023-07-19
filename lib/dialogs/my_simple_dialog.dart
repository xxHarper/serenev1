import 'package:flutter/material.dart';

class MySimpleDialog extends StatelessWidget {
  final String txt;
  final Color letter;
  MySimpleDialog({Key? key, required this.txt, required this.letter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
              child: Text(
                txt,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cerrar',
                style: TextStyle(color: letter),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
