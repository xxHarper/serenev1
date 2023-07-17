import 'package:flutter/material.dart';

import '../../components/my_swot.dart';

class Opportunities extends StatefulWidget {
  List<String> opportunitiesList;
  Opportunities({Key? key, required this.opportunitiesList}) : super(key: key);

  @override
  _OpportunitiesState createState() => _OpportunitiesState();
}

class _OpportunitiesState extends State<Opportunities> {
  final Color back = const Color(0xff42BF9F);
  final Color lightBackground = const Color(0XFFE2FFF7);
  final Color letter = const Color(0XFF3A907A);
  final Color border = Colors.greenAccent;

  final TextEditingController opportunitiesController = TextEditingController();

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
              "OPORTUNIDADES\n(aspectos que dependen del entorno de las personas y se deben sacar provecho de estas)",
          swot: "Agrega tus oportunidades",
          myController: opportunitiesController,
          swotList: widget.opportunitiesList,
          height: 130,
        ));
  }
}
