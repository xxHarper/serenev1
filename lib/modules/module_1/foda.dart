import 'package:flutter/material.dart';
import 'package:serenev1/components/my_circular_container.dart';
import 'package:serenev1/components/my_foda_container.dart';
import 'package:serenev1/modules/module_1/opportunities.dart';
import 'package:serenev1/modules/module_1/strengths.dart';
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

  List<String> strenghts = [
    "•  Sabiduría y conocimiento",
    "•  Curiosidad / Interés en el mundo",
    "•  Juicio / Pensamiento crítico / Apertura mental",
    "•  Ingenio / Originalidad / Inteligencia práctica / Espabilado",
    "•  Inteligencia social / Inteligencia personal / Inteligencia emocional",
    "•  Perspectiva / Valor / Perseverancia",
    "•  Valor y bravura",
    "•  Perseverancia / Laboriosidad / DiligenciaPerseverancia / Laboriosidad / Diligencia",
    "•  Integridad / Autenticidad / Honestidad",
    "•  Amabilidad y generosidad",
    "•  Amar y permitirse ser amado",
    "•  Ciudadanía / Deber / Trabajo en equipo / Lealtad",
    "•  Imparcialidad e igualdad",
    "•  Liderazgo",
    "•  Autocontrol",
    "•  Prudencia / Discreción / Cautela",
    "•  Humildad y modestia",
    "•  Aprecio por la belleza y la excelencia",
    "•  Gratitud",
    "•  Esperanza / Optimismo / Pensamiento orientado al futuro",
    "•  Espiritualidad / Sentido de propósito / Religiosidad",
    "•  Perdón y piedad",
    "•  Jocosidad y humor",
    "•  Vivacidad / Pasión / Entusiasmo",
  ];

  List<String> weaknesses = [
    "•  Ignorancia / Desconocimiento",
    "•  Desinterés / Apatía",
    "•  Desatino / Sinrazón",
    "•  Incapacidad / Torpeza",
    "•  Ineptitud social / Estupidez personal / Desavenencia emocional",
    "•  Ineficacia / Inutilidad / Negligencia",
    "•  Cobardía / Vergüenza",
    "•  Negligencia / Desidia",
    "•  Podredumbre / Deshonestidad",
    "•  Mezquindad / Codicia",
    "•  Odio / Aborrecer",
    "•  Traición / Desvergüenza",
    "•  Injusticia / Parcialidad",
    "•  Carencia de dirección, organización, autoridad, dominio de grupo",
    "•  Descontrol / Descuido",
    "•  Osadía / Ligereza",
    "•  Soberbia / Arrogancia",
    "•  Aprecio por la fealdad y antiestética",
    "•  Ingratitud / Deslealtad",
    "•  Desesperanza / Desaliento / Pesimismo",
    "•  Materialismo / Agnosticismo",
    "•  Castigo / Crueldad / Severidad",
    "•  Seriedad / disgusto",
    "•  Desaliento / Tibieza"
  ];

  List<String> opportunities = [
    "•  Apoyo familiar y social (educación, psicoemocional, comunicación, económico, nutricional, salud, seguridad, situación ambiental, entretenimiento, cultural, tecnológico)",
    "•  Apoyo del gobierno (educación, trabajo, vivienda, económico, comunicación, servicios salud y seguridad, situación ambiental, entretenimiento, psicosocial, cultural, tecnológico)",
    "•  Apoyo institucional (educación, trabajo, vivienda, económico, comunicación, servicios salud y seguridad, situación ambiental, entretenimiento, psicosocial, cultural, tecnológico)",
    "•  Prevención de accidentes y desastres naturales"
  ];

  List<String> threads = [
    "•  Falta de apoyo familiar y social (educación, psicoemocional, comunicación, económico, nutricional, salud, seguridad, situación ambiental, entretenimiento, cultural, tecnológico)",
    "•  Falta de apoyo del gobierno (educación, trabajo, vivienda, económico, comunicación, servicios salud y seguridad, situación ambiental, entretenimiento, psicosocial, cultural, tecnológico)",
    "•  Falta de apoyo institucional (educación, trabajo, vivienda, económico, comunicación, servicios salud y seguridad, situación ambiental, entretenimiento, psicosocial, cultural, tecnológico)",
    "•  Falta de prevención de accidentes y desastres naturales"
  ];

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
                      children: <Widget>[
                        //STRENGHTS CONTAINER
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Strengths(
                                        strengthsList: strenghts,
                                      )),
                            );
                          },
                          child: MyFodaContainer(
                              txt: "Fortalezas",
                              backColor: Colors.cyan,
                              boxShadowColor: Colors.cyanAccent),
                        ),

                        //THREADS CONTAINER
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Threads(
                                        threadsList: threads,
                                      )),
                            );
                          },
                          child: MyFodaContainer(
                              txt: "Amenazas",
                              backColor: Colors.lightGreen,
                              boxShadowColor: Colors.lightGreenAccent),
                        ),

                        //OPPORTUNITIES CONTAINER
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Opportunities(
                                        opportunitiesList: opportunities,
                                      )),
                            );
                          },
                          child: MyFodaContainer(
                              txt: "Oportunidades",
                              backColor: Colors.grey,
                              boxShadowColor: Colors.blueGrey),
                        ),

                        //WEAKNESSES CONTAINER
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Weaknesses(
                                        weaknessesList: weaknesses,
                                      )),
                            );
                          },
                          child: MyFodaContainer(
                              txt: "Debilidades",
                              backColor: Colors.pink,
                              boxShadowColor: Colors.pinkAccent),
                        ),
                      ],
                    ),

                    //ME CONTAINER
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
