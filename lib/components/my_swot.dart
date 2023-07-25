import 'package:flutter/material.dart';

import '../services/local_storage.dart';
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
  final List<String> preSwotList;
  final List<String> swotList;
  final String localName;
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
      required this.preSwotList,
      required this.swotList,
      required this.localName,
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

            // SHOW THE LIST OF ...
            MyFodaListviewBuilder(
                list: widget.swotList.isNotEmpty
                    ? widget.swotList
                    : widget.preSwotList,
                back: widget.back,
                lightBackground: widget.lightBackground,
                letter: widget.letter),

            // ADD NEW
            MyFodaTextfield(
                onSubmitted: (text) {
                  if (text == "") {
                  } else {
                    widget.myController.clear();
                    setState(() {
                      widget.swotList.add("•  $text");
                      LocalStorage.prefs
                          .setStringList(widget.localName, widget.swotList);
                    });
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
