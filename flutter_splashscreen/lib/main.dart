import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/img/logo.png',
            ),
            const CircularProgressIndicator(
              color: Color(0xFF00be6d),
            ),
          ],
        ),
      ),
    ),
  );
}
