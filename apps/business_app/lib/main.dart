import 'package:business_app/screens/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:components/component/theme/theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

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
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        home: const BottomNavBarScreen());
  }
}
