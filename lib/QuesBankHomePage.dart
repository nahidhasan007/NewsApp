import 'package:flutter/material.dart';

class QuesBankHomePage extends StatelessWidget {
  const QuesBankHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tap Me Page"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ), // AppBar
    ); // Scaffold
  }
}