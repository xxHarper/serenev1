import 'package:flutter/material.dart';

class MyFodaListviewBuilder extends StatefulWidget {
  final List<String> list;
  final Color back;
  final Color lightBackground;
  final Color letter;

  MyFodaListviewBuilder({
    Key? key,
    required this.list,
    required this.back,
    required this.lightBackground,
    required this.letter,
  }) : super(key: key);

  @override
  _MyFodaListviewBuilderState createState() => _MyFodaListviewBuilderState();
}

class _MyFodaListviewBuilderState extends State<MyFodaListviewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: widget.lightBackground,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        child: ListView.builder(
            itemCount: widget.list.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.list[index],
                    style: TextStyle(
                        color: widget.letter,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ));
            }),
      ),
    );
  }
}
