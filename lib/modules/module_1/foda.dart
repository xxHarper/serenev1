import 'package:flutter/material.dart';
import 'package:serenev1/components/my_circular_container.dart';
import 'package:serenev1/components/my_foda_container.dart';

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
      appBar: AppBar(
        backgroundColor: back,
      ),
      body: Container(
        color: back,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          color: lightBackground,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 10.0),
                child: Text(
                  instructions,
                  style: TextStyle(
                      color: letter, fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              ),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      children: const <Widget>[
                        MyFodaContainer(
                            txt: "Fortalezas",
                            backColor: Colors.cyan,
                            boxShadowColor: Colors.cyanAccent),
                        MyFodaContainer(
                            txt: "Amenzas",
                            backColor: Colors.lightGreen,
                            boxShadowColor: Colors.lightGreenAccent),
                        MyFodaContainer(
                            txt: "Oportunidades",
                            backColor: Colors.grey,
                            boxShadowColor: Colors.blueGrey),
                        MyFodaContainer(
                            txt: "Debilidades",
                            backColor: Colors.pink,
                            boxShadowColor: Colors.pinkAccent),
                      ],
                    ),
                    const Center(
                      child: MyCircularContainer(
                        size: 150,
                        back: Colors.orange,
                        child: Center(child: Text("YO")),
                      ),
                    ), 
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
