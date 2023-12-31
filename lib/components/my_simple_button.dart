import 'package:flutter/material.dart';

class MySimpleButton extends StatelessWidget {
  final Function()? onPressed;
  final String txt;
  final Color back;
  final Color txtColor;
  final double? btnWidth;
  final bool enabled;

  const MySimpleButton(
      {Key? key,
      required this.onPressed,
      required this.txt,
      required this.back,
      required this.txtColor,
      this.enabled = true,
      this.btnWidth = 250})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: enabled ? onPressed : null,
        style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            fixedSize: Size.fromWidth(btnWidth!),
            backgroundColor: back,
            side: const BorderSide(width: 2, color: Colors.black)),
        child: Text(txt, style: TextStyle(color: txtColor, fontSize: 18)),
      ),
    );
  }
}
