import 'package:flutter/material.dart';
import 'package:serenev1/components/my_top_module_title.dart';
import 'package:serenev1/modules/module_1/objectives.dart';
import 'package:serenev1/videos/video_screen.dart';

class Video extends StatelessWidget {
  const Video({Key? key}) : super(key: key);

  final Color letter = const Color(0XFF3A907A);
  final Color lightBackground = const Color(0XFFE2FFF7);
  final Color back = const Color(0xff42BF9F);
  final String url =
      "https://firebasestorage.googleapis.com/v0/b/demos-d97a5.appspot.com/o/Modulo_2%2Foshi.mp4?alt=media&token=98f2afac-b6c2-409c-b0d9-9dcd80fec334";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: back,
      ),
      backgroundColor: back,
      body: Column(
        children: [
          MyTopModuleTitle(
              title: "Bloque 1 \nAumenta tu motivación",
              letter: letter,
              lightBackground: lightBackground),
          Expanded(
            child: Container(
              color: lightBackground,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    child: VideoScreen(url),
                  ),
                  Center(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Objectives()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                          fixedSize: const Size.fromWidth(250),
                          backgroundColor: back,
                          side:
                              const BorderSide(width: 2, color: Colors.black)),
                      child: const Text("Continuar",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
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
