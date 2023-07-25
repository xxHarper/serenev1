import 'package:flutter/material.dart';
import 'package:serenev1/components/my_simple_button.dart';
import 'package:serenev1/components/my_simple_container.dart';
import 'package:serenev1/components/my_top_module_title.dart';
import 'package:serenev1/modules/module_1/objectives.dart';
import 'package:serenev1/videos/video_screen.dart';

import '../../components/my_simple_app_bar.dart';

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

            // VIDEO
            Expanded(
                child: MySimpleContainer(
              lightBackground: lightBackground,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  VideoScreen(url),
                  Center(
                    child: MySimpleButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Objectives()),
                        );
                      },
                      txt: "Continuar",
                      back: back,
                      txtColor: Colors.white,
                      btnWidth: 120,
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
