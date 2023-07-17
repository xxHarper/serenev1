import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:serenev1/components/my_top_module_title.dart';
import 'package:serenev1/modules/module_1/detonant.dart';

import '../../components/my_simple_app_bar.dart';

class Module1 extends StatefulWidget {
  const Module1({Key? key}) : super(key: key);

  @override
  _Module1State createState() => _Module1State();
}

class _Module1State extends State<Module1> {
  final Color letter = const Color(0XFF3A907A);
  final Color lightBackground = const Color(0XFFE2FFF7);
  final Color back = const Color(0xff42BF9F);
  final welcomeText =
      "Hola! \n\nQué gusto verte en el primer \nbloque para aumentar tu \nmotivación y entender cómo \npuede ser la clave para lograr \ncambios positivos en tu vida. ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MySimpleAppBar(back: back, lightBackground: lightBackground),
      backgroundColor: back,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyTopModuleTitle(
              title: "Bloque 1 \nAumenta tu motivación",
              letter: letter,
              lightBackground: lightBackground),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              color: const Color(0XFFE2FFF7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 220,
                    child: DefaultTextStyle(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: letter,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            FadeAnimatedText(welcomeText,
                                textAlign: TextAlign.center,
                                duration: const Duration(milliseconds: 6000))
                          ],
                          repeatForever: true,
                        )),
                  ),
                  Center(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Detonant()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                          fixedSize: const Size.fromWidth(250),
                          backgroundColor: back,
                          side:
                              const BorderSide(width: 2, color: Colors.black)),
                      child: const Text("Comenzar",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
