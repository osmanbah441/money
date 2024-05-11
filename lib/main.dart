import 'package:flutter/material.dart';
import 'package:money/services/services_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: Scaffold(
          body: ServicesScreen(),
        ),
      );
}
