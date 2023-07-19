import 'package:flutter/material.dart';
import 'package:serenev1/components/my_swot.dart';

import '../../components/my_simple_app_bar.dart';

class Weaknesses extends StatefulWidget {
  List<String> weaknessesList;
  List<String> preWeaknessesList;

  Weaknesses(
      {Key? key, required this.weaknessesList, required this.preWeaknessesList})
      : super(key: key);

  @override
  _WeaknessesState createState() => _WeaknessesState();
}

class _WeaknessesState extends State<Weaknesses> {
  final Color back = const Color(0xff42BF9F);
  final Color lightBackground = const Color(0XFFE2FFF7);
  final Color letter = const Color(0XFF3A907A);
  final Color border = Colors.greenAccent;

  final TextEditingController weaknessesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MySimpleAppBar(back: back, lightBackground: lightBackground),
        backgroundColor: back,
        body: MySwot(
          back: back,
          lightBackground: lightBackground,
          letter: letter,
          border: border,
          title:
              "DEBILIDADES\n(aspectos propios de la persona y deben ser superadas)",
          swot: "Agrega tus debilidades",
          myController: weaknessesController,
          swotList: widget.weaknessesList,
          localName: "weaknesses",
          preSwotList: widget.preWeaknessesList,
        ));
  }
}
