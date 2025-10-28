import 'package:flutter/material.dart';
import 'package:wealthmind/src/presentation/pages/auth/login/LoginContent.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /*
  Hot reload : Ctrl + S
  Hot restart
  Full restart
  */

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Colors.blueGrey,
      body: LoginContent(),
    );
  }
}
