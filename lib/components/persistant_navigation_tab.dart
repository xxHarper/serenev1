/*

import 'package:flutter/material.dart';
import 'package:serenev1/pages/home_page.dart';
import 'package:serenev1/pages/profile_page.dart';
import 'package:serenev1/pages/social_page.dart';
import 'package:serenev1/pedometer/step_counter.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    Widget? child;
    if (tabItem == "Modules") {
      child = const HomePage();
    } else if (tabItem == "Physical") {
      child = const StepCounter();
    } else if (tabItem == "Profile") {
      child = const ProfilePage();
    } else if (tabItem == "Social") {
      child = const SocialPage();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child!);
      },
    );
  }
}


*/