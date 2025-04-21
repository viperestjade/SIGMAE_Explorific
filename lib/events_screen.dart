import 'package:flutter/material.dart';
import 'for_you_screen.dart';
import 'trends_screen.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF4D3),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Title Image
          Image.asset(
            'assets/images/title.png',
            width: 250,
          ),

          const SizedBox(height: 10),

          // Navigation Bar with Events List
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
                  // Navigation Buttons
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

                  const SizedBox(height: 10),

                  // Events List
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                spreadRadius: 2,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Text(
                            "Upcoming Event ${index + 1}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavLogo(
      BuildContext context, String imagePath, double size, Widget screen) {
    return InkWell(
      onTap: () {
        if (screen.runtimeType != runtimeType) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        }
      },
      child: SizedBox(
        width: size,
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }
}
