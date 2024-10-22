import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("SVG"),
            SvgPicture.asset("assets/svg/36-Teenager 1.svg"),
            const Text("custom painter"),
          ],
        ),
      ),
    );
  }
}
