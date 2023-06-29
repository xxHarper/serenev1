import 'package:flutter/material.dart';
import 'package:serenev1/auth/main_page.dart';
import 'package:serenev1/intro_screens/intro_page_1.dart';
import 'package:serenev1/intro_screens/intro_page_2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  //const OnboardingScreen({Key? key}) : super(key: key);
  final VoidCallback showMainPage;
  const OnboardingScreen({Key? key, required this.showMainPage}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Controller to keep track of which page  we're on
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 1);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              /* Container(
                color: Color(0xffb5ddbd),
              ), */
            ],
          ),

          // Dot indicators
          Container(
              alignment: Alignment(0, 0.8),
              child: DefaultTextStyle(
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.normal),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Skip
                      GestureDetector(
                        child: Text("Skip"),
                        onTap: () {
                          _controller.jumpToPage(1);
                        },
                      ),

                      // Dot indicator
                      SmoothPageIndicator(controller: _controller, count: 2),

                      // Next or Done
                      onLastPage
                          ? GestureDetector(
                              child: Text("Hecho"),
                              onTap: widget.showMainPage,/*() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MainPage();
                                }));
                              },*/
                            )
                          : GestureDetector(
                              child: Text("Siguiente"),
                              onTap: () {
                                _controller.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              },
                            )
                    ],
                  )))
        ],
      ),
    );
  }
}
