import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/constants.dart';
import 'package:fluttertest/screens/home_page.dart';
import 'package:flutterfire_ui/auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterTest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage(title: 'Fluttertest');
            } else {
              return const SignInScreen(
                resizeToAvoidBottomInset: true,
                providerConfigs: [
                  GoogleProviderConfiguration(
                      clientId: Constants.googleSignInClientId),
                  EmailProviderConfiguration(),
                ],
              );
            }
          }),
    );
  }
}
