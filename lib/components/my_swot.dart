import 'package:flutter/material.dart';

import 'my_foda_listview_builder.dart';
import 'my_foda_textfield.dart';
import 'my_top_module_title.dart';

class MySwot extends StatefulWidget {
  final Color back;
  final Color lightBackground;
  final Color letter;
  final Color border;
  final String title;
  final String swot;
  final TextEditingController myController;
  final List<String> swotList;
  final double height;

  const MySwot(
      {Key? key,
      required this.back,
      required this.lightBackground,
      required this.letter,
      required this.border,
      required this.title,
      required this.swot,
      required this.myController,
      required this.swotList,
      this.height = 100})
      : super(key: key);

  @override
  _MySwotState createState() => _MySwotState();
}

class _MySwotState extends State<MySwot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.back,
        body: Column(
          children: [
            //TITLE
            MyTopModuleTitle(
              title: widget.title,
              letter: widget.letter,
              lightBackground: widget.lightBackground,
              height: widget.height,
            ),

            // SHOW THE LIST OF STRENGHTS
            MyFodaListviewBuilder(
                list: widget.swotList,
                back: widget.back,
                lightBackground: widget.lightBackground,
                letter: widget.letter),

            // ADD NEW STRENGHTS
            MyFodaTextfield(
                onSubmitted: (text) {
                  if (text == "") {
                  } else {
                    widget.swotList.add("•  " + text);
                    widget.myController.clear();
                    setState(() {});
                  }
                },
                textController: widget.myController,
                list: widget.swotList,
                hint: widget.swot,
                back: widget.back,
                lightBackground: widget.lightBackground,
                letter: widget.letter,
                border: widget.border),
          ],
        ));
  }
}
