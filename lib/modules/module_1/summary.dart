import 'package:flutter/material.dart';
import 'package:serenev1/components/my_simple_button.dart';
import 'package:serenev1/components/my_top_module_title.dart';
import 'package:serenev1/dialogs/my_simple_dialog_list.dart';
import 'package:serenev1/main_holder.dart';

import '../../components/my_checkbox_list.dart';
import '../../components/my_circular_container.dart';
import '../../components/my_foda_container.dart';
import '../../components/my_simple_app_bar.dart';
import '../../services/local_storage.dart';

class Summary extends StatelessWidget {
  final List<bool> objetives;
  final List<String> txt;
  final List<String> strenghts;
  final List<String> threads;
  final List<String> opportunities;
  final List<String> weaknesses;

  Summary(
      {Key? key,
      required this.objetives,
      required this.txt,
      required this.strenghts,
      required this.threads,
      required this.opportunities,
      required this.weaknesses})
      : super(key: key);

  final Color back = const Color(0xff42BF9F);
  final Color lightBackground = const Color(0XFFE2FFF7);
  final Color letter = const Color(0XFF3A907A);
  final String name = LocalStorage.prefs.getString("name") ?? "Alberto";

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
              MyTopModuleTitle(
                title: "Resumen",
                letter: letter,
                lightBackground: lightBackground,
                vertical: 0,
                horizontal: 0,
                height: 50,
              ),

              //OBJETIVES
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                color: lightBackground,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                      children: [
                        TextSpan(
                          text: "¡Bien $name!\n\n",
                        ),
                        const TextSpan(
                            text: "Tus metas son:",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18)),
                      ],
                    )),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: objetives.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CheckboxList(
                              checkboxValue: objetives[index],
                              txt: txt[index],
                              enabled: true,
                              back: back);
                        })
                  ],
                ),
              ),

              //FODA
              Container(
                color: lightBackground,
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.all(12),
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
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return MySimpleDialogList(
                                        list: strenghts, letter: letter);
                                  });
                            },
                            child: const MyFodaContainer(
                              letterColor: Colors.white,
                              txt: "Fortalezas",
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
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return MySimpleDialogList(
                                        list: threads, letter: letter);
                                  });
                            },
                            child: const MyFodaContainer(
                              letterColor: Colors.white,
                              txt: "Amenazas",
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
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return MySimpleDialogList(
                                        list: opportunities, letter: letter);
                                  });
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
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return MySimpleDialogList(
                                        list: weaknesses, letter: letter);
                                  });
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

              //HOME BUTTON
              Container(
                color: lightBackground,
                child: MySimpleButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainHolder()),
                    );
                  },
                  txt: "Terminar",
                  back: back,
                  txtColor: Colors.white,
                  btnWidth: 120,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
