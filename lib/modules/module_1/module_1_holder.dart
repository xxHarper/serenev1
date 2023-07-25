import 'package:flutter/material.dart';
import 'package:serenev1/modules/module_1/module_1.dart';

import '../../components/my_bottom_nav_bar.dart';
import '../../components/navigation_tab.dart';
import '../../pages/profile_page.dart';
import '../../pages/social_page.dart';
import '../../pedometer/step_counter.dart';

class Module1Holder extends StatefulWidget {
  const Module1Holder({Key? key}) : super(key: key);

  @override
  _Module1HolderState createState() => _Module1HolderState();
}

class _Module1HolderState extends State<Module1Holder> {
  // This selected index is to control the bottom nav bar
  String currentPage = "Module1";
  int _selectedIndex = 0;

  // This method will update our selected index
  // when the user taps on the bottom nav bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> pageKeys = ["Module1"];
  Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
    "Module1": GlobalKey<NavigatorState>(),
  };

  void _selectTab(String tabItem, int index) {
    if (tabItem == currentPage) {
      navigatorKeys[tabItem]?.currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await navigatorKeys[currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (currentPage != "Modules") {
            _selectTab("Modules", 1);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            buildOffNavigator("Modules"),
            buildOffNavigator("Physical"),
            buildOffNavigator("Profile"),
            buildOffNavigator("Social"),
          ],
        ),
        bottomNavigationBar: MyBottomNavBar(
          onTabChange: (int index) {
            _selectTab(pageKeys[index], index);
          },
        ),
      ),
    );
  }

  Widget buildOffNavigator(String tabItem) {
    return Offstage(
      offstage: currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
