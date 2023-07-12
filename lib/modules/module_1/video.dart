import 'package:flutter/material.dart';
import 'package:serenev1/components/top_module_1.dart';
import 'package:serenev1/modules/module_1/objectives.dart';
import 'package:serenev1/videos/video_screen.dart';

class Video extends StatelessWidget {
  const Video({Key? key}) : super(key: key);

  final String url =
      "https://firebasestorage.googleapis.com/v0/b/demos-d97a5.appspot.com/o/Modulo_2%2Foshi.mp4?alt=media&token=98f2afac-b6c2-409c-b0d9-9dcd80fec334";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff42BF9F),
      ),
      backgroundColor: const Color(0xff42BF9F),
      body: Column(
        children: [
          const TopModule1(),
          Expanded(
            child: Container(
              color: const Color(0XFFE2FFF7),
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
                          backgroundColor: const Color(0xff42BF9F),
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
