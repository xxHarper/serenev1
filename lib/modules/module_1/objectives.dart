import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:serenev1/components/my_checkbox_list.dart';
import 'package:serenev1/components/my_simple_button.dart';
import 'package:serenev1/components/my_simple_container.dart';
import 'package:serenev1/components/my_top_module_title.dart';
import 'package:serenev1/modules/module_1/foda.dart';

import '../../components/my_simple_app_bar.dart';
import '../../data/user_database.dart';
import '../../services/local_storage.dart';

class Objectives extends StatefulWidget {
  const Objectives({Key? key}) : super(key: key);

  @override
  _ObjectivesState createState() => _ObjectivesState();
}

class _ObjectivesState extends State<Objectives> {
  final String instructions =
      "¡Es hora de empezar! Tómate un momento para reflexionar sobre los objetivos que te gustaría trabajar aquí. Estos serán los puntos en los que nos enfocaremos para mejorar tu bienestar.";

  final Color back = const Color(0xff42BF9F);
  final Color lightBackground = const Color(0XFFE2FFF7);
  final Color letter = const Color(0XFF3A907A);

  UserDatabase db = UserDatabase();
  final _myBox = Hive.box("User_Database");

  @override
  void initState() {
    // If it's the first time...
    if (_myBox.get("objetivesModule1") == null) {
      db.initObjetives();
    } else {
      db.loadObjetives();
    }

    super.initState();
  }

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
                title: "Bloque 1 \nAumenta tu motivación",
                letter: letter,
                lightBackground: lightBackground),

            // OBJETIVES
            Expanded(
                child: MySimpleContainer(
                    lightBackground: lightBackground,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // INSTRUCTIONS
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 10.0),
                            child: Text(
                              instructions,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          // Show the Objetives
                          CheckboxList(
                            back: back,
                            items: db.objetivesModule1,
                          ),

                          // Next Button
                          MySimpleButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Foda()),
                              );
                            },
                            txt: "Listo",
                            back: back,
                            txtColor: Colors.white,
                            btnWidth: 100,
                          )
                        ],
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
