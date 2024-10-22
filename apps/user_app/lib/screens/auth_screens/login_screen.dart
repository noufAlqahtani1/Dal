import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:user_app/paints/custom_paints/shape1.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade400,
      body: Stack(
        children: [
          CustomPaint(
            painter: MyPainter(),
            child: SizedBox(
              height: 100,
              width: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  hintStyle: TextStyle(color: Color(0x80000000)),
                  labelText: "Email",
                  hintText: "Enter your email",
                  fillColor: Color(0xffEAEAEA),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintStyle: TextStyle(color: Color(0x80000000)),
                  hintText: "Enter your password",
                  fillColor: Color(0xffEAEAEA),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
