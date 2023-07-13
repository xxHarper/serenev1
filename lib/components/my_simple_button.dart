import 'package:flutter/material.dart';

class MySimpleButton extends StatelessWidget {
  final Function()? onPressed;
  final String txt;
  final Color back;
  final Color txtColor;
  final double? btnWidth;

  const MySimpleButton(
      {Key? key,
      required this.onPressed,
      required this.txt,
      required this.back,
      required this.txtColor,
      this.btnWidth = 250})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            fixedSize: Size.fromWidth(btnWidth!),
            backgroundColor: back,
            side: const BorderSide(width: 2, color: Colors.black)),
        child:
            Text("Continuar", style: TextStyle(color: txtColor, fontSize: 18)),
      ),
    );
  }
}
