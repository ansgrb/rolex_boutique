import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0b4f3a),
      body: Center(child: CircularProgressIndicator(color: Colors.white)),
    );
  }
}
