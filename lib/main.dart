import 'package:flutter/material.dart';
import 'dart:async';
import 'login_and_signup.dart';
import 'login_form.dart';
import 'signup_form.dart';
import 'welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingScreen(),
        '/login_and_signup': (context) => const LoginAndSignupScreen(),
        '/login_form': (context) => const LoginFormScreen(),
        '/signup_form': (context) => const SignupFormScreen(),
        '/welcome': (context) => const WelcomeScreen(),
      },
    );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login_and_signup');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF4D3),
      body: Center(
        child: Image.asset(
          'assets/images/explorific.png',
          width: MediaQuery.of(context).size.width * 0.4, // Responsive width
        ),
      ),
    );
  }
}
