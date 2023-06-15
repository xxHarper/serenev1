import 'package:flutter/material.dart';
import 'package:serenev1/pages/login_page.dart';

import '../pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // At first shows Login Page and the welcome to the user
  bool showLoginPage = true;
  bool showWelcome = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
      showWelcome = !showWelcome;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreens);
    } else {
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}
