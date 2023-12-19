import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/others/decorations/project_colors.dart';
import 'package:elk_frontend/production/presentation/pages/splash_screen_page/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MainStrings.mainTitle,
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: MainColors.color1,
            primary: MainColors.color1,
            secondary: MainColors.color2,
            brightness: Brightness.light,
          ),
        ),
      home: const SplashScreen(),
    );
  }
}
