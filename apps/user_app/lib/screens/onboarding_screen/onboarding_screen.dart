import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/screens/auth_screens/create_account_screen.dart';
import 'package:user_app/screens/auth_screens/login_screen.dart';
import 'package:user_app/services/location_permission/location_permission.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    getPermission();
    super.initState();
  }

  getPermission() async {
    await determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 40,
                ),
                SvgPicture.asset("assets/svg/36-Teenager 1.svg"),
                const SizedBox(
                  height: 40,
                ),
                const Column(
                  children: [
                    CustomText(
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                        text: "Know Whats Ahead Of You!",
                        color: Color(0xff444444),
                        fontSize: 36),
                    SizedBox(
                      height: 9,
                    ),
                    CustomText(
                        textAlign: TextAlign.center,
                        text:
                            "Login and get to know all about the activities around you ",
                        color: Color(0xff444444),
                        fontSize: 16),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    CustomElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      backgroundColor: const Color(0xffA51361),
                      child: const CustomText(
                          text: "Login",
                          color: Color(0xffF7F7F7),
                          fontSize: 14),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateAccountScreen()));
                        },
                        child: const CustomText(
                            text: "Or create an account",
                            color: Color(0xff444444),
                            fontSize: 16))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
