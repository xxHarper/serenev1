import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  final welcomeText =
      "¡Me alegra verte! \nTe invitamos a registrarte y \ncomienza a dedicarte tiempo \npara construir una \nvida más saludable.";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfffcb5ac),
      /* decoration: BoxDecoration(
        color: Color(0xfffcb5ac),
        image: DecorationImage(
            image: AssetImage("./assets/images/logo.png"),
            fit: BoxFit.fitHeight),
      ), */

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            child: Image(image: AssetImage("./assets/images/logo.png")),
          ),
          SizedBox(
            height: 50,
          ),

          /* Text(
            welcomeText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ), */

          DefaultTextStyle(
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText(
                    welcomeText,
                    textAlign: TextAlign.center,duration: Duration(milliseconds: 6000)
                  )
                ],
                repeatForever: true,
              )),
        ],
      ),

      /* child: Center(
        child: Text(
          welcomeText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ), */
    );
  }
}
