import 'package:flutter/material.dart';
import 'package:flutter_application_1/gradient_container.dart';

void main() {
  runApp(const MaterialUI());
}

class MaterialUI extends StatelessWidget {
  const MaterialUI({super.key});

  @override
  Widget build(context) {
    return const MaterialApp(
      home: Scaffold(
        body: GradientContainer([Colors.orange, Colors.white, Colors.green]),
      ),
    );
  }
}
