import 'package:cozo/src/features/splash/presentation/views/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Cozo());
}

class Cozo extends StatelessWidget {
  const Cozo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
