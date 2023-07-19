import 'package:flutter/material.dart';
import 'package:serenev1/components/my_swot.dart';

import '../../components/my_simple_app_bar.dart';

class Threads extends StatefulWidget {
  List<String> threadsList;
  List<String> preThreadsList;

  Threads({Key? key, required this.threadsList, required this.preThreadsList})
      : super(key: key);

  @override
  _ThreadsState createState() => _ThreadsState();
}

class _ThreadsState extends State<Threads> {
  final Color back = const Color(0xff42BF9F);
  final Color lightBackground = const Color(0XFFE2FFF7);
  final Color letter = const Color(0XFF3A907A);
  final Color border = Colors.greenAccent;

  final TextEditingController threadsController = TextEditingController();

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
            "AMENAZAS\n(aspectos que dependen del entorno de las personas, se deben identificar y prevenir)",
        swot: "Agrega tus amenazas",
        myController: threadsController,
        swotList: widget.threadsList,
        localName: "threads",
        preSwotList: widget.preThreadsList,
        height: 130,
      ),
    );
  }
}
