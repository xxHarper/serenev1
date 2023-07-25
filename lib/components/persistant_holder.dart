/*

import 'package:flutter/material.dart';

import 'components/my_bottom_nav_bar.dart';
import 'components/my_drawer.dart';
import 'components/navigation_tab.dart';

class MainHolder extends StatefulWidget {
  const MainHolder({Key? key}) : super(key: key);

  @override
  _MainHolderState createState() => _MainHolderState();
}

class _MainHolderState extends State<MainHolder> {
  int _selectedIndex = 0;
  String currentPage = "Modules";

  List<String> pageKeys = ["Modules", "Physical", "Profile", "Social"];
  Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
    "Modules": GlobalKey<NavigatorState>(),
    "Physical": GlobalKey<NavigatorState>(),
    "Profile": GlobalKey<NavigatorState>(),
    "Social": GlobalKey<NavigatorState>(),
  };

  void selectTab(String tabItem, int index) {
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
            selectTab("Modules", 1);

            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        backgroundColor: Color(0xff4F3C75),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff4F3C75),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: const Text(
            'S E R E N E',
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: MyDrawer(),
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
            selectTab(pageKeys[index], index);
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


*/