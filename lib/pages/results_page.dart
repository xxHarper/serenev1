import 'package:flutter/material.dart';
import 'package:serenev1/components/my_simple_app_bar.dart';
import 'package:serenev1/components/my_top_module_title.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  // COLORS
  final Color back = const Color(0xffBF426A);
  final Color lightBackground = const Color(0xffFFE2EA);
  final Color letter = const Color(0xff903A57);
  final Color backBar = Colors.pink.shade100;

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
                height: 50,
                title: "Evaluación Previa",
                letter: letter,
                lightBackground: lightBackground)
          ],
        ),
      ),
    );
  }
}
