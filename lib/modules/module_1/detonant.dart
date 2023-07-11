import 'package:flutter/material.dart';
import 'package:serenev1/modules/module_1/quiz.dart';
import 'package:serenev1/videos/video_screen.dart';

class Detonant extends StatefulWidget {
  const Detonant({Key? key}) : super(key: key);

  @override
  _DetonantState createState() => _DetonantState();
}

class _DetonantState extends State<Detonant> {
  final String url =
      "https://firebasestorage.googleapis.com/v0/b/demos-d97a5.appspot.com/o/Modulo_2%2Foshi.mp4?alt=media&token=98f2afac-b6c2-409c-b0d9-9dcd80fec334";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff42BF9F),
      ),
      backgroundColor: Color(0xff42BF9F),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            height: 100,
            width: double.infinity,
            color: Color(0XFFE2FFF7),
            child: Text(
              "Bloque 1 \nAumenta tu motivación",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0XFF3A907A),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0XFFE2FFF7),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    child: VideoScreen(url),
                  ),
                  Center(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Quiz()),
                        );
                      },
                      child: Text("Siguiente",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      style: OutlinedButton.styleFrom(
                          fixedSize: Size.fromWidth(250),
                          backgroundColor: Color(0xff42BF9F),
                          side: BorderSide(width: 2, color: Colors.black)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
