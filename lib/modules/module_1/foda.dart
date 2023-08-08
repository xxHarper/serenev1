import 'package:flutter/material.dart';
import 'package:serenev1/components/my_circular_container.dart';
import 'package:serenev1/components/my_foda_container.dart';
import 'package:serenev1/components/my_simple_app_bar.dart';
import 'package:serenev1/components/my_simple_button.dart';
import 'package:serenev1/components/my_simple_container.dart';
import 'package:serenev1/modules/module_1/opportunities.dart';
import 'package:serenev1/modules/module_1/strengths.dart';
import 'package:serenev1/modules/module_1/summary.dart';
import 'package:serenev1/modules/module_1/threads.dart';
import 'package:serenev1/modules/module_1/weaknesses.dart';

class Foda extends StatefulWidget {
  const Foda({Key? key}) : super(key: key);

  @override
  _FodaState createState() => _FodaState();
}

class _FodaState extends State<Foda> {
  final Color back = const Color(0xff42BF9F);
  final Color lightBackground = const Color(0XFFE2FFF7);
  final Color letter = const Color(0XFF3A907A);
  final String instructions =
      "Ahora que has reflexionado sobre tus metas y has entendido lo importante que es tenerlas, vamos a hacer un ejercicio que te ayudará a comprender por qué es tan crucial que te esfuerces por alcanzarlas. Saber esto puede brindarte una motivación significativa y, cada vez que te sientas tentado a abandonar tu meta, podrás recordar tu \"por qué\".";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MySimpleAppBar(back: back, lightBackground: lightBackground),
      backgroundColor: back,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // INSTRUCTIONS
              MySimpleContainer(
                lightBackground: lightBackground,
                child: Text(
                  instructions,
                  style: TextStyle(
                      color: letter, fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              ),

              // FODA
              MySimpleContainer(
                lightBackground: lightBackground,
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        children: <Widget>[
                          //STRENGHTS CONTAINER
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Strengths()),
                              ).then((value) => setState(() {}));
                            },
                            child: const MyFodaContainer(
                              txt: "Fortalezas",
                              letterColor: Colors.white,
                              backColor: Colors.cyan,
                              boxShadowColor: Colors.cyanAccent,
                              topx: 0,
                              topy: 360,
                              botx: 300,
                              boty: 100,
                            ),
                          ),

                          //THREADS CONTAINER
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Threads()),
                              ).then((value) => setState(() {}));
                            },
                            child: const MyFodaContainer(
                              txt: "Amenazas",
                              letterColor: Colors.white,
                              backColor: Colors.orange,
                              boxShadowColor: Colors.orangeAccent,
                              topx: 360,
                              topy: 0,
                              botx: 100,
                              boty: 300,
                            ),
                          ),

                          //OPPORTUNITIES CONTAINER
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Opportunities()),
                              ).then((value) => setState(() {}));
                            },
                            child: const MyFodaContainer(
                              txt: "Oportunidades",
                              letterColor: Colors.white,
                              backColor: Colors.lightGreen,
                              boxShadowColor: Colors.lightGreenAccent,
                              topx: 360,
                              topy: 100,
                              botx: 0,
                              boty: 300,
                            ),
                          ),

                          //WEAKNESSES CONTAINER
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Weaknesses()),
                              ).then((value) => setState(() {}));
                            },
                            child: const MyFodaContainer(
                              txt: "Debilidades",
                              letterColor: Colors.white,
                              backColor: Colors.pink,
                              boxShadowColor: Colors.pinkAccent,
                              topx: 100,
                              topy: 300,
                              botx: 360,
                              boty: 0,
                            ),
                          ),
                        ],
                      ),

                      //ME CONTAINER
                      const Center(
                        child: MyCircularContainer(
                          size: 120,
                          back: Colors.grey,
                          child: Center(child: Text("YO")),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // BUTTON
              MySimpleContainer(
                  padding: 0,
                  lightBackground: lightBackground,
                  child: MySimpleButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Summary()),
                      ).then((value) => setState(() {}));
                    },
                    txt: "Continuar",
                    back: back,
                    txtColor: Colors.white,
                    btnWidth: 120,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
