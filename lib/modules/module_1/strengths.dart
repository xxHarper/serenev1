import 'package:flutter/material.dart';
import 'package:serenev1/components/my_foda_listview_builder.dart';
import 'package:serenev1/components/my_foda_textfield.dart';
import 'package:serenev1/components/my_simple_button.dart';
import 'package:serenev1/components/my_top_module_title.dart';

class Strengths extends StatefulWidget {
  List<String> strengthsList;

  Strengths({Key? key, required this.strengthsList}) : super(key: key);

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
        appBar: AppBar(
          backgroundColor: back,
        ),
        backgroundColor: back,
        body: Column(
          children: [
            //TITLE
            MyTopModuleTitle(
                title:
                    "FORTALEZAS\n(aspectos propios de la persona y deben de ser desarrolladas)",
                letter: letter,
                lightBackground: lightBackground),

            // SHOW THE LIST OF STRENGHTS
            MyFodaListviewBuilder(
                list: widget.strengthsList,
                back: back,
                lightBackground: lightBackground,
                letter: letter),

            // ADD NEW STRENGHTS
            MyFodaTextfield(
                onSubmitted: (text) {
                  if (text == "") {
                  } else {
                    widget.strengthsList.add("•  " + text);
                    strengthsController.clear();
                    setState(() {});
                  }
                },
                textController: strengthsController,
                list: widget.strengthsList,
                hint: "Agrega tus fortalezas:",
                back: back,
                lightBackground: lightBackground,
                letter: letter,
                border: border),
          ],
        ));
  }
}
