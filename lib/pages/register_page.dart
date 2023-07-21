import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:serenev1/auth/terms_of_use.dart';
import 'package:serenev1/dialogs/policy_dialog.dart';
import 'package:serenev1/services/local_storage.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

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
          LocalStorage.prefs.setString("name", _nameControl.text.trim());
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
      /* backgroundColor: Colors.grey[300], */
      backgroundColor: const Color(0xff6EC6FF),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),

                  // HOLA
                  const Text(
                    "Te esperamos!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Color(0xff0B5382),
                    ),
                  ),

                  const Text(
                    "Ingresa tus datos abajo",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff0B5382),
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  // NOMBRE
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffDFF3FF),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Agrega tu nombre';
                            }
                          },
                          controller: _nameControl,
                          decoration: const InputDecoration(
                              hintText: "Nombre", border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // APELLIDO
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffDFF3FF),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Agrega tus apellidos';
                            }
                          },
                          controller: _lastNameControl,
                          decoration: const InputDecoration(
                              hintText: "Apellidos", border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // EDAD
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffDFF3FF),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Agrega tu edad';
                            }
                          },
                          controller: _ageControl,
                          decoration: const InputDecoration(
                              hintText: "Edad", border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // ESTADO CIVIL
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                          color: const Color(0xffDFF3FF),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          value: civilStatus,
                          hint: const Text("Estado Civil"),
                          items: civilStatuses.map(buildMenuItem).toList(),
                          onChanged: (value) =>
                              setState(() => this.civilStatus = value),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // GENERO
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                          color: const Color(0xffDFF3FF),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          value: gender,
                          hint: const Text("Género"),
                          items: genders.map(buildMenuItem).toList(),
                          onChanged: (value) =>
                              setState(() => this.gender = value),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // OCUPACIÓN
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                          color: const Color(0xffDFF3FF),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          value: ocupation,
                          hint: const Text("Ocupación"),
                          items: ocupations.map(buildMenuItem).toList(),
                          onChanged: (value) =>
                              setState(() => this.ocupation = value),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // NIVEL DE ESTUDIOS
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                          color: const Color(0xffDFF3FF),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          value: education,
                          hint: const Text("Nivel de Educación"),
                          items: educationLevel.map(buildMenuItem).toList(),
                          onChanged: (value) =>
                              setState(() => this.education = value),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // EMAIL
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffDFF3FF),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Agrega tu correo';
                            }
                          },
                          controller: _emailControl,
                          decoration: const InputDecoration(
                              hintText: "Correo", border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //Password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffDFF3FF),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Agrega tu contraseña';
                            }
                          },
                          controller: _passwordControl,
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: "Contraseña", border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //Confirmar password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffDFF3FF),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Confirma tu contraseña';
                            } else if (value != _passwordControl) {
                              return "Las contraseñas no coinciden";
                            }
                          },
                          controller: _confirmPasswordControl,
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: "Confirmar Contraseña",
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  const Text(
                    textAlign: TextAlign.center,
                    "Al crear una cuenta estás de acuerdo con nuestro",
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),

                  // Policy Privacy
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return PolicyDialog(
                                    mdFileName: "privacy_policy.md");
                              });
                        },
                        child: const Text(
                          textAlign: TextAlign.center,
                          "Aviso de Privacidad y",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0B5382),
                          ),
                        ),
                      )),

                  // PTerms of use
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
                        child: const Text(
                          textAlign: TextAlign.center,
                          "Términos y Condiciones",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0B5382),
                          ),
                        ),
                      )),

                  const SizedBox(
                    height: 20,
                  ),

                  //Register button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      /* onTap: registrarse, */
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          registrarse;
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: const Color(0xff2980B9),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
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

                  const SizedBox(
                    height: 25,
                  ),

                  //Register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Ya tengo cuenta!",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: widget.showLoginPage,
                        child: const Text(
                          "  Iniciar sesión",
                          style: TextStyle(
                              color: Color(0xff0B5382),
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
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
          style: const TextStyle(fontSize: 18),
        ),
      );
}
