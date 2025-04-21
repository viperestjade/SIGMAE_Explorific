import 'package:flutter/material.dart';
import 'events_screen.dart';
import 'for_you_screen.dart';
import 'trends_screen.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF4D3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Recommendations',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF073B3A),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDE8C8),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildNavLogo(context, 'assets/images/events.png', 80,
                            const EventsScreen()),
                        _buildNavLogo(context, 'assets/images/for_you.png', 95,
                            const ForYouScreen()),
                        _buildNavLogo(context, 'assets/images/trends.png', 80,
                            const TrendsScreen()),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Here are some recommendations for you!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF073B3A),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavLogo(BuildContext context, String imagePath, double size,
      Widget targetScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
      child: SizedBox(
        width: size,
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }
}
