
import 'package:flutter/material.dart';
import 'Screens/input_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0E21),

        primaryColor: const Color(0xFF00E5FF),

        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00E5FF),
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),

      home: const InputScreen(),
    );
  }
}
