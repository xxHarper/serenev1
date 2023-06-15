import 'package:flutter/material.dart';

class TechnicalServicePage extends StatefulWidget {
  const TechnicalServicePage({ Key? key }) : super(key: key);

  @override
  _TechnicalServicePageState createState() => _TechnicalServicePageState();
}

class _TechnicalServicePageState extends State<TechnicalServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: Text(
          'SERVICIO TÉCNICO',
          style: TextStyle(color: Colors.grey[800]),
        ),
      ),
      body: const Center(
          child: Text(
              'Hola, envía un correo con una breve descripción de los sucedido y una captura de pantalla..')),
    );
  }
}