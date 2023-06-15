import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:serenev1/auth/verify_email_page.dart';

import 'auth_page.dart';

class MainPage extends StatelessWidget {
//const MainPage({ Key? key }) : super(key: key);
final VoidCallback showOnBoardingScreen;
const MainPage({Key? key, required this.showOnBoardingScreen}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            //return HomePage();
            return VerifyEmailPage();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}