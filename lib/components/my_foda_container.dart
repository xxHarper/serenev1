import 'package:flutter/material.dart';

class MyFodaContainer extends StatelessWidget {
  final String txt;
  final Color backColor;
  final Color boxShadowColor;
  final double? containerHeight;

  const MyFodaContainer(
      {Key? key,
      required this.txt,
      required this.backColor,
      required this.boxShadowColor,
      this.containerHeight = 200})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight!,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: backColor,
        boxShadow: [
          BoxShadow(
            color: boxShadowColor.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
          child: Text(
        txt,
        textAlign: TextAlign.center,
      )),
    );
  }
}
