import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:serenev1/modules/module_1/detonant.dart';

class Module1 extends StatefulWidget {
  const Module1({Key? key}) : super(key: key);

  @override
  _Module1State createState() => _Module1State();
}

class _Module1State extends State<Module1> {
  final welcomeText =
      "Hola! \n\nQué gusto verte en el primer \nbloque para aumentar tu \nmotivación y entender cómo \npuede ser la clave para lograr \ncambios positivos en tu vida. ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff42BF9F),
        title: Text(
          "",
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Color(0xff42BF9F),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            height: 100,
            width: double.infinity,
            color: Color(0XFFE2FFF7),
            child: Text(
              "Bloque 1 \nAumenta tu motivación",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0XFF3A907A),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              color: Color(0XFFE2FFF7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 220,
                    child: DefaultTextStyle(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0XFF3A907A),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            FadeAnimatedText(welcomeText,
                                textAlign: TextAlign.center,
                                duration: Duration(milliseconds: 6000))
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
                      child: Text("Comenzar",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      style: OutlinedButton.styleFrom(
                          fixedSize: Size.fromWidth(250),
                          backgroundColor: Color(0xff42BF9F),
                          side: BorderSide(width: 2, color: Colors.black)),
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
