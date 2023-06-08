import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_system_tutorial1/login_or_register.dart';
import 'components/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot) {
          // user logged in
          if (snapshot.hasData == null) {
            return HomePage();
          }

          // not logged in
          else {
            return LoginOrRegisterPage();
          }
        },
      )
    );
  }
}