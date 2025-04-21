import 'package:flutter/material.dart';
import 'recommendation.dart';
import 'events_screen.dart';

class AllowAccessScreen extends StatelessWidget {
  const AllowAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF4D3),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/gps_access.png',
                width: 350,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAccessButton('Allow While Using', context,
                    width: 110, fontSize: 11),
                const SizedBox(width: 10),
                _buildAccessButton('Allow Once', context, width: 90),
                const SizedBox(width: 10),
                _buildAccessButton("Don't Allow", context, width: 90),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccessButton(String text, BuildContext context,
      {double fontSize = 12, double width = 95}) {
    return SizedBox(
      width: width,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          if (text == "Don't Allow") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EventsScreen()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RecommendationScreen()),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEDE8C8),
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
