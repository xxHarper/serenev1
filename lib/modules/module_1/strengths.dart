import 'package:flutter/material.dart';
import '../../components/my_simple_app_bar.dart';
import '../../components/my_swot.dart';

class Strengths extends StatefulWidget {
  List<String> preStrengthsList;
  List<String> strengthsList;

  Strengths(
      {Key? key, required this.preStrengthsList, required this.strengthsList})
      : super(key: key);

  @override
  _StrengthsState createState() => _StrengthsState();
}

class _StrengthsState extends State<Strengths> {
  final Color back = const Color(0xff42BF9F);
  final Color lightBackground = const Color(0XFFE2FFF7);
  final Color letter = const Color(0XFF3A907A);
  final Color border = Colors.greenAccent;

  final TextEditingController strengthsController = TextEditingController();

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
            "FORTALEZAS\n(aspectos propios de la persona y deben de ser desarrolladas)",
        swot: "Agrega tus fortalezas",
        myController: strengthsController,
        swotList: widget.strengthsList,
        localName: "strenghts",
        preSwotList: widget.preStrengthsList,
      ),
    );
  }
}
