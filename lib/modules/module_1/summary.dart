import 'package:flutter/material.dart';
import 'package:serenev1/components/my_top_module_title.dart';
import 'package:serenev1/services/local_storage.dart';

import '../../components/my_checkbox_list.dart';
import '../../components/my_simple_app_bar.dart';

class Summary extends StatefulWidget {
  final List<bool> objetives;
  final List<String> txt;

  const Summary({Key? key, required this.objetives, required this.txt})
      : super(key: key);

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  final Color back = const Color(0xff42BF9F);
  final Color lightBackground = const Color(0XFFE2FFF7);
  final Color letter = const Color(0XFF3A907A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MySimpleAppBar(back: back, lightBackground: lightBackground),
      backgroundColor: back,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Column(
          children: [
            MyTopModuleTitle(
              title: "Resumen",
              letter: letter,
              lightBackground: lightBackground,
              vertical: 0,
              horizontal: 0,
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              color: lightBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: const TextSpan(
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18),
                    children: [
                      TextSpan(
                        text: "¡Bien Lopez!\n\n",
                      ),
                      TextSpan(
                          text: "Tus metas son:\n\n",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 18)),
                    ],
                  )),
                  /* Expanded(
                    child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Text("Hola");/* CheckboxList(
                              checkboxValue: widget.objetives[index],
                              txt: widget.txt[index],
                              enabled: true,
                              back: back) */
                        }),
                  ) */
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
