import 'package:components/component/theme/theme.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';
import 'package:user_app/screens/home_screen/home_screen.dart';
import 'package:user_app/screens/auth_screens/login_screen.dart';
import 'package:user_app/screens/onboarding_screen/onboarding_screen.dart';

import 'package:user_app/screens/profile_screen/profile_screen.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => MainApp(), // Wrap your app
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}
