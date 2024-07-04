import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_splashscreen/screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: '온글잎 언즈체',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Colors.white,
          fontSize: 80,
          fontFamily: 'cafe24',
        ),
        displayMedium: TextStyle(
          color: Colors.white,
          fontSize: 50,
        ),
        displaySmall: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    ),
    home: const HomeScreen(),
  ));
}
