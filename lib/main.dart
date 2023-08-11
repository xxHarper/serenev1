import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:serenev1/onboarding_screen.dart';
import 'package:serenev1/services/local_storage.dart';
import 'package:serenev1/services/notification_services.dart';

import 'auth/main_page.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initNotifications();
  await LocalStorage.configurePrefs();
  // init the hive database
  await Hive.initFlutter();
  // open a box
  await Hive.openBox("User_Database");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme:
            GoogleFonts.titilliumWebTextTheme(Theme.of(context).textTheme),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Obtain shared preferences.
  bool showWelcomeScreens = LocalStorage.prefs.getBool("welcomeScreen") ?? true;
  /* bool showWelcomeScreens = true; */

  void toggleSc() {
    setState(() {
      showWelcomeScreens = !showWelcomeScreens;
      LocalStorage.prefs.setBool("welcomeScreen", false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showWelcomeScreens) {
      return OnboardingScreen(showMainPage: toggleSc);
    } else {
      return MainPage(showOnBoardingScreen: toggleSc);
    }
  }
}
