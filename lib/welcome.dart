import 'package:flutter/material.dart';
import 'allow_access.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF4D3),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const AllowAccessScreen()),
            );
          },
          child: Image.asset(
            'assets/images/welcome.png',
            width: 500,
          ),
        ),
      ),
    );
  }
}
