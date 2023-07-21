import 'package:flutter/material.dart';
import 'package:serenev1/pages/home_page.dart';
import 'package:serenev1/pages/profile_page.dart';
import 'package:serenev1/pages/social_page.dart';
import 'package:serenev1/pedometer/step_counter.dart';

import 'components/my_bottom_nav_bar.dart';
import 'components/my_drawer.dart';

class MainHolder extends StatefulWidget {
  const MainHolder({ Key? key }) : super(key: key);

  @override
  _MainHolderState createState() => _MainHolderState();
}

class _MainHolderState extends State<MainHolder> {
  // This selected index is to control the bottom nav bar
  int _selectedIndex = 0;

  // This method will update our selected index
  // when the user taps on the bottom nav bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    // home page
    const HomePage(),

    // step_counter page
    const StepCounter(),

    // profile page
    const ProfilePage(),

    // social page
    const SocialPage(),
  ];

  @override
  Widget build(BuildContext context) {
    /*

    UI - I like a more minimal style so that's what I did here, 
    but you can change up the colors and decorate it to your preference

    */
    return Scaffold(
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
      body: _pages[_selectedIndex],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}