import 'package:flutter/material.dart';
import 'package:user_app/screens/home_screen/home_screen.dart';
import 'package:user_app/screens/auth_screens/login_screen.dart';
import 'package:user_app/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
