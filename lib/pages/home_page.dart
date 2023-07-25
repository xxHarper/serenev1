import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:serenev1/modules/module_1/module_1.dart';
import 'package:serenev1/pages/evaluation_page.dart';

import '../services/notification_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  String? mtoken = " ";

  //IDs
  List<String> docIDs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission();
    //getToken();
    initInfo();
  }

  //Firebase Messages
  initInfo() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      //print("onmessage: ${message.notification?.title}/${message.notification?.body}");
      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
          message.notification!.body.toString(),
          htmlFormatBigText: true,
          contentTitle: message.notification!.title.toString(),
          htmlFormatContentTitle: true);

      AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails("dbfood", "dbfood",
              importance: Importance.max,
              styleInformation: bigTextStyleInformation,
              priority: Priority.max,
              playSound: true);

      //Darwin for IOS
      const darwinNotificationDetails =
          DarwinNotificationDetails(presentSound: true);

      NotificationDetails platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: darwinNotificationDetails);

      await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
          message.notification?.body, platformChannelSpecifics,
          payload: message.data["body"]);
    });
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission();
  }

  //Obtener IDs
  Future getDocIDs() async {
    /*showNotification(
        "Titulo", "Probando notificaciones");*/ //Mostramos notificacion
    docIDs.clear(); //Evita que se dupliquen cada HotReload xd

    await FirebaseFirestore.instance
        .collection("usuarios")
        .orderBy("edad", descending: true)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach(
            (element) {
              print(element.reference);
              docIDs.add(element.reference.id);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4F3C75),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Evaluacion Previa
          Container(
              color: Color(0xffDDCCFE),
              height: 100,
              child: Center(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EvaluationPage()),
                    );
                  },
                  child: Text("Evaluación Previa",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  style: OutlinedButton.styleFrom(
                      fixedSize: Size.fromWidth(250),
                      backgroundColor: Color(0xff4F3C75),
                      side: BorderSide(width: 2, color: Colors.black)),
                ),
              )),

          SizedBox(
            height: 20,
          ),

          Expanded(
            /* color: Color(0xffDDCCFE), */
            child: AbsorbPointer(
              absorbing: false,
              child: Container(
                color: Color(0xffDDCCFE),
                child: ListView(
                  children: [
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Module1()),
                            );
                          },
                          child: Container(
                            child: Center(
                                child: Text(
                              "1. Aumenta tu motivación",
                              textAlign: TextAlign.center,
                            )),
                            height: 200,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.grey[200],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.purpleAccent.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Center(
                              child: Text(
                            "2. Hábitos saludables",
                            textAlign: TextAlign.center,
                          )),
                          height: 200,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey[200],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purpleAccent.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Center(
                              child: Text(
                            "3. Mis apoyos y relaciones sociales",
                            textAlign: TextAlign.center,
                          )),
                          height: 200,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey[200],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purpleAccent.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Center(
                              child: Text(
                            "4. El poder de mis emociones",
                            textAlign: TextAlign.center,
                          )),
                          height: 200,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey[200],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purpleAccent.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Center(
                              child: Text(
                            "5. Viviendo en plenitud",
                            textAlign: TextAlign.center,
                          )),
                          height: 200,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey[200],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purpleAccent.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Center(
                              child: Text(
                            "6. Afrontando situaciones",
                            textAlign: TextAlign.center,
                          )),
                          height: 200,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey[200],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purpleAccent.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )

                    /* GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) => Container(
                        height: 200,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey[200],
                        ),
                      ),
                    ), */
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          /* // MODULO 1
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/module_1",
                );
              },
              child: const Text("Módulo 1")), */

          // DATOS
          /* Expanded(
            child: FutureBuilder(
              future: getDocIDs(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: GetUserName(
                            documentId: docIDs[index],
                          ),
                          tileColor: Colors.grey[200],
                        ),
                      );
                    });
              },
            ),
          ), */
        ],
      )),
    );
  }
}
