import 'package:flutter/material.dart';
import 'package:serenev1/components/my_swot.dart';

import '../../components/my_foda_listview_builder.dart';
import '../../components/my_foda_textfield.dart';
import '../../components/my_top_module_title.dart';

class Threads extends StatefulWidget {
  List<String> threadsList;
  Threads({Key? key, required this.threadsList}) : super(key: key);

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
      appBar: AppBar(
        backgroundColor: back,
      ),
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
        height: 130,
      ),
    );
  }
}
