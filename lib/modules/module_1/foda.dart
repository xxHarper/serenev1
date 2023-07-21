import 'package:flutter/material.dart';
import 'package:serenev1/components/my_circular_container.dart';
import 'package:serenev1/components/my_foda_container.dart';
import 'package:serenev1/components/my_simple_app_bar.dart';
import 'package:serenev1/components/my_simple_button.dart';
import 'package:serenev1/modules/module_1/opportunities.dart';
import 'package:serenev1/modules/module_1/strengths.dart';
import 'package:serenev1/modules/module_1/summary.dart';
import 'package:serenev1/modules/module_1/threads.dart';
import 'package:serenev1/modules/module_1/weaknesses.dart';
import 'package:serenev1/services/local_storage.dart';

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

  List<String> strenghts = LocalStorage.prefs.getStringList("strenghts") ?? [];
  List<String> preStrenghts = [
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

  List<String> weaknesses =
      LocalStorage.prefs.getStringList("weaknesses") ?? [];
  List<String> preWeaknesses = [
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

  List<String> opportunities =
      LocalStorage.prefs.getStringList("opportunities") ?? [];
  List<String> preOpportunities = [
    "•  Apoyo familiar y social (educación, psicoemocional, comunicación, económico, nutricional, salud, seguridad, situación ambiental, entretenimiento, cultural, tecnológico)",
    "•  Apoyo del gobierno (educación, trabajo, vivienda, económico, comunicación, servicios salud y seguridad, situación ambiental, entretenimiento, psicosocial, cultural, tecnológico)",
    "•  Apoyo institucional (educación, trabajo, vivienda, económico, comunicación, servicios salud y seguridad, situación ambiental, entretenimiento, psicosocial, cultural, tecnológico)",
    "•  Prevención de accidentes y desastres naturales"
  ];

  List<String> threads = LocalStorage.prefs.getStringList("threads") ?? [];
  List<String> preThreads = [
    "•  Falta de apoyo familiar y social (educación, psicoemocional, comunicación, económico, nutricional, salud, seguridad, situación ambiental, entretenimiento, cultural, tecnológico)",
    "•  Falta de apoyo del gobierno (educación, trabajo, vivienda, económico, comunicación, servicios salud y seguridad, situación ambiental, entretenimiento, psicosocial, cultural, tecnológico)",
    "•  Falta de apoyo institucional (educación, trabajo, vivienda, económico, comunicación, servicios salud y seguridad, situación ambiental, entretenimiento, psicosocial, cultural, tecnológico)",
    "•  Falta de prevención de accidentes y desastres naturales"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MySimpleAppBar(back: back, lightBackground: lightBackground),
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
                                        preStrengthsList: preStrenghts,
                                        strengthsList: strenghts,
                                      )),
                            ).then((value) => setState(() {}));
                          },
                          child: MyFodaContainer(
                            txt: strenghts.isNotEmpty
                                ? "Fortalezas\n${strenghts.first}\n${strenghts.last}"
                                : "Fortalezas",
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
                                  builder: (context) => Threads(
                                        preThreadsList: preThreads,
                                        threadsList: threads,
                                      )),
                            ).then((value) => setState(() {}));
                          },
                          child: MyFodaContainer(
                            txt: threads.isNotEmpty
                                ? "Amenazas\n${threads.first}\n${threads.last}"
                                : "Amenazas",
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
                                  builder: (context) => Opportunities(
                                        opportunitiesList: opportunities,
                                        preOpportunitiesList: preOpportunities,
                                      )),
                            ).then((value) => setState(() {}));
                          },
                          child: MyFodaContainer(
                            txt: opportunities.isNotEmpty
                                ? "Oportunidades\n${opportunities.first}\n${opportunities.last}"
                                : "Oportunidades",
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
                                  builder: (context) => Weaknesses(
                                        preWeaknessesList: preWeaknesses,
                                        weaknessesList: weaknesses,
                                      )),
                            ).then((value) => setState(() {}));
                          },
                          child: MyFodaContainer(
                            txt: weaknesses.isNotEmpty
                                ? "Debilidades\n${weaknesses.first}\n${weaknesses.last}"
                                : "Debilidades",
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
              MySimpleButton(
                onPressed: () {
                  List<bool> cboxes = [];
                  List<bool> objectives = [];
                  List<String> cboxesText = [];
                  List<String> objectivesText = [];

                  cboxes.add(LocalStorage.prefs.getBool("cbox1") ?? false);
                  cboxes.add(LocalStorage.prefs.getBool("cbox2") ?? false);
                  cboxes.add(LocalStorage.prefs.getBool("cbox3") ?? false);
                  cboxes.add(LocalStorage.prefs.getBool("cbox4") ?? false);
                  cboxes.add(LocalStorage.prefs.getBool("cbox5") ?? false);
                  cboxes.add(LocalStorage.prefs.getBool("cbox6") ?? false);
                  cboxes.add(LocalStorage.prefs.getBool("cbox7") ?? false);
                  cboxes.add(LocalStorage.prefs.getBool("cbox8") ?? false);
                  cboxes.add(LocalStorage.prefs.getBool("cbox9") ?? false);
                  cboxes.add(LocalStorage.prefs.getBool("cbox10") ?? false);
                  cboxes.add(LocalStorage.prefs.getBool("cbox11") ?? false);
                  cboxes.add(LocalStorage.prefs.getBool("cbox12") ?? false);
                  cboxes.add(LocalStorage.prefs.getBool("cbox13") ?? false);

                  cboxesText.add(
                      "Aprender técnicas de relajación para reducir el estrés de manera efectiva.");
                  cboxesText.add(
                      "Mejorar la habilidad de comunicación interpersonal para establecer relaciones más saludables y satisfactorias.");
                  cboxesText.add(
                      "Optimizar la calidad y duración de mi descanso para mejorar mi bienestar general.");
                  cboxesText.add(
                      "Desarrollar habilidades para manejar y regular mis emociones de forma saludable y equilibrada.");
                  cboxesText
                      .add("Fortalecer mi autoestima y confianza personal.");
                  cboxesText.add(
                      "Implementar estrategias efectivas para gestionar conflictos de manera constructiva.");
                  cboxesText.add(
                      "Incorporar regularmente técnicas de mindfulness para aumentar la conciencia plena.");
                  cboxesText.add(
                      "Adoptar hábitos que promuevan mi bienestar físico y mental.");
                  cboxesText.add(
                      "Desarrollar la capacidad de adaptación y flexibilidad ante situaciones cambiantes.");
                  cboxesText.add(
                      "Aprender a establecer límites personales de manera clara y asertiva.");
                  cboxesText.add(
                      "Ampliar mi autoconocimiento para comprender mejor mis necesidades emocionales y satisfacerlas.");
                  cboxesText.add(
                      "Mejorar mi habilidad para administrar el tiempo de manera eficiente y evitar la procrastinación.");
                  cboxesText.add(
                      "Promover la participación en actividades que incrementen mi bienestar emocional y disfrute personal.");

                  for (var i = 0; i < cboxes.length; i++) {
                    if (cboxes[i]) {
                      objectives.add(cboxes[i]);
                      objectivesText.add(cboxesText[i]);
                    }
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Summary(
                              objetives: objectives,
                              txt: objectivesText,
                              strenghts: strenghts,
                              threads: threads,
                              opportunities: opportunities,
                              weaknesses: weaknesses,
                            )),
                  ).then((value) => setState(() {
                        objectives.clear();
                        objectivesText.clear();
                      }));
                },
                txt: "Continuar",
                back: back,
                txtColor: Colors.white,
                btnWidth: 120,
              )
            ],
          ),
        ),
      ),
    );
  }
}
