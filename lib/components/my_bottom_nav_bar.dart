import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

/*

B O T T O M N A V B A R

This is the Bottom Navigation Bar from Google. 
It gives a sleek modern look and feel.
You can change up the style to fit your preference,
but I like this modern look with the nice little animations!

Here you can create your buttons that should correspond to the pages.

*/

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  Color _colorContainer = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        child: Container(
          /* color: Color.fromARGB(255, 255, 255, 255), */
          color: _colorContainer,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: GNav(
            //When no in use
            color: Colors.black54,
            activeColor: Colors.white,
            //Surroanding
            tabBackgroundColor: Colors.grey.shade800,
            padding: const EdgeInsets.all(5),
            gap: 8,
            onTabChange: (value) => onTabChange!(value),
            tabs: const [
              GButton(
                icon: Icons.account_tree,
                text: 'Módulos',
                backgroundColor: Color(0xff4F3C75),
              ),
              GButton(
                icon: Icons.add_chart,
                text: 'Estado Físico',
                backgroundColor: Colors.redAccent,
              ),
              GButton(
                icon: Icons.person,
                text: 'Perfil',
                backgroundColor: Color(0xffFFC63A),
              ),
              GButton(
                icon: Icons.message,
                text: 'Social',
                backgroundColor: Color(0xff6EC6FF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
