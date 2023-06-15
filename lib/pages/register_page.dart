import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:serenev1/auth/terms_of_use.dart';
import 'package:serenev1/dialogs/policy_dialog.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final civilStatuses = [
    "Solter@",
    "Casad@",
    "Divorciad@",
    "Viud@",
  ];

  final genders = ["Masculino", "Femenino", "Prefiero no decir", "Otro"];

  final ocupations = ["Obrero", "Estudiante", "Ama de Casa", "..."];

  final educationLevel = [
    "Primaria",
    "Secundaria",
    "Bachillerato",
    "Carrera Técnica",
    "Licenciatura",
    "Posgrado"
  ];

  // Controladores del texto
  final _emailControl = TextEditingController();
  final _passwordControl = TextEditingController();
  final _confirmPasswordControl = TextEditingController();
  final _nameControl = TextEditingController();
  final _lastNameControl = TextEditingController();
  final _ageControl = TextEditingController();
  String? mtoken = " ";
  String? civilStatus, gender, ocupation, education;
  String tok = " ";

  Future registrarse() async {
    if (passwordConfirmed()) {
      // Autenticando usuario
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailControl.text.trim(),
          password: _passwordControl.text.trim());

      await FirebaseMessaging.instance.getToken().then((token) {
        setState(() {
          mtoken = token;
        });
        //saveToken(token!);
        addData(
            _nameControl.text.trim(),
            _lastNameControl.text.trim(),
            int.parse(_ageControl.text.trim()),
            civilStatus!,
            gender!,
            ocupation!,
            education!,
            _emailControl.text.trim(),
            token!);
      });
    }
  }

  Future addData(
      String nombre,
      String apellido,
      int edad,
      String civilState,
      String gender,
      String ocupation,
      String education,
      String email,
      token) async {
    //getToken();
    await FirebaseFirestore.instance.collection("usuarios").add({
      "nombre": nombre,
      "apellido": apellido,
      "edad": edad,
      "estadoCivil": civilState,
      "genero": gender,
      "ocupacion": ocupation,
      "educacion": education,
      "email": email,
      "token": token,
    });
  }

  bool passwordConfirmed() {
    if (_passwordControl.text.trim() == _confirmPasswordControl.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailControl.dispose();
    _passwordControl.dispose();
    _nameControl.dispose();
    _lastNameControl.dispose();
    _ageControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),

                // HOLA
                Text(
                  "Te esperamos!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),

                Text(
                  "Ingresa tus datos abajo",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                // NOMBRE
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _nameControl,
                        decoration: InputDecoration(
                            hintText: "Nombre", border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                // APELLIDO
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _lastNameControl,
                        decoration: InputDecoration(
                            hintText: "Apellidos", border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                // EDAD
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _ageControl,
                        decoration: InputDecoration(
                            hintText: "Edad", border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                // ESTADO CIVIL
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        value: civilStatus,
                        hint: Text("Estado Civil"),
                        items: civilStatuses.map(buildMenuItem).toList(),
                        onChanged: (value) =>
                            setState(() => this.civilStatus = value),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                // GENERO
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        value: gender,
                        hint: Text("Género"),
                        items: genders.map(buildMenuItem).toList(),
                        onChanged: (value) =>
                            setState(() => this.gender = value),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                // OCUPACIÓN
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        value: ocupation,
                        hint: Text("Ocupación"),
                        items: ocupations.map(buildMenuItem).toList(),
                        onChanged: (value) =>
                            setState(() => this.ocupation = value),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                // NIVEL DE ESTUDIOS
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        value: education,
                        hint: Text("Nivel de Educación"),
                        items: educationLevel.map(buildMenuItem).toList(),
                        onChanged: (value) =>
                            setState(() => this.education = value),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                // EMAIL
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
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
                        color: Colors.grey[200],
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

                //Confirmar password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _confirmPasswordControl,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Confirmar Contraseña",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Text(
                  textAlign: TextAlign.center,
                  "Al crear una cuenta estás de acuerdo con los",
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),

                // Terms of use
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return PolicyDialog(
                                  mdFileName: "terms_of_use.md");
                            });
                      },
                      child: Text(
                        textAlign: TextAlign.center,
                        "Términos y Condiciones",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )

                    /*RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "Al crear una cuenta esta de acuerdo con los\n",
                          style: Theme.of(context).textTheme.bodyText1,
                          children: [
                            TextSpan(
                                text: "Términos y Condiciones",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {showDialog(context: context, builder: (context){
                                    return PolicyDialog(mdFileName: "terms_and_conditions.md");
                                  });
                                  // Open dialog with terms and conditions
                                  })
                          ]),
                    )*/
                    ),

                SizedBox(
                  height: 20,
                ),

                //Register button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: registrarse,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color(0xffd88dbc),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          "Registrarse",
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
                      "Ya tengo cuenta!",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        "  Iniciar sesión",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 18),
        ),
      );
}
