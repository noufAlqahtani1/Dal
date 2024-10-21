import 'package:components/component/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade400,
      body: const Center(
        child: Padding(
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
      ),
    );
  }
}
