import 'package:flutter/material.dart';

class MyFodaContainer extends StatelessWidget {
  final String txt;
  final Color backColor;
  final Color boxShadowColor;
  final double? containerHeight;
  final Color letterColor;
  final double topx;
  final double topy;
  final double botx;
  final double boty;

  const MyFodaContainer(
      {Key? key,
      required this.txt,
      required this.backColor,
      required this.boxShadowColor,
      this.containerHeight = 200,
      this.letterColor = Colors.black,
      required this.topx,
      required this.topy,
      required this.botx,
      required this.boty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight!,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        /* borderRadius: BorderRadius.circular(4), */
        borderRadius: BorderRadius.only(
            /* topLeft: Radius.elliptical(topx, topy),
          bottomRight: Radius.elliptical(botx, boty), */
            topLeft: Radius.circular(topx),
            topRight: Radius.circular(topy),
            bottomLeft: Radius.circular(botx),
            bottomRight: Radius.circular(boty)),
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
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: letterColor),
      )),
    );
  }
}
