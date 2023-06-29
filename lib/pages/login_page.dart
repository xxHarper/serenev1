import 'package:better_player/better_player.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text Controllers
  final _emailControl = TextEditingController();
  final _passwordControl = TextEditingController();
  GlobalKey _betterPlayerKey = GlobalKey();
  BetterPlayerController? _betterPlayerController;
  String url =
      "https://firebasestorage.googleapis.com/v0/b/demos-d97a5.appspot.com/o/Modulo_2%2Foshi.mp4?alt=media&token=98f2afac-b6c2-409c-b0d9-9dcd80fec334";

  Future iniciarSesion() async {
    //Circulo de carga
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailControl.text.trim(),
        password: _passwordControl.text.trim());

    // Remove the circle
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    // TODO: implement initState
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      autoPlay: false,
      aspectRatio: 16 / 9,
      fit: BoxFit.fitWidth,
    );

    BetterPlayerDataSourceType type = BetterPlayerDataSourceType.network;

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(type, url);

    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);

    _betterPlayerController!.setupDataSource(dataSource);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailControl.dispose();
    _passwordControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFC63A),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 75,
                ),

                //HOla
                Text(
                  "Hola!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6C4B28),
                    fontSize: 36,
                  ),
                ),

                Text(
                  "Bienvenido",
                  style: TextStyle(fontSize: 20, color: Color(0xff6C4B28)),
                ),

                SizedBox(
                  height: 50,
                ),

                Container(
                  width: 300,
                  child: BetterPlayer(
                      key: _betterPlayerKey,
                      controller: _betterPlayerController!),
                ),

                SizedBox(
                  height: 50,
                ),

                //Email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffFEECD9),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailControl,
                        decoration: InputDecoration(
                            hintText: "Correo", border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffFEECD9),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordControl,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Contraseña", border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgotPasswordPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Olvidaste tu contraseña?",
                          style: TextStyle(
                              color: Color(0xff085394), fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //Login button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: iniciarSesion,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color(0xff42BF51),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          "Iniciar Sesión",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 25,
                ),

                //Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No tienes cuenta?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(
                        "  Registratate ahora",
                        style: TextStyle(
                            color: Color(0xff085394), fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
