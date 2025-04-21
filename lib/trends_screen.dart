import 'package:flutter/material.dart';
import 'events_screen.dart';
import 'for_you_screen.dart';

class TrendsScreen extends StatefulWidget {
  const TrendsScreen({super.key});

  @override
  _TrendsScreenState createState() => _TrendsScreenState();
}

class _TrendsScreenState extends State<TrendsScreen> {
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

          // Navigation Bar with Grid Content
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

                  // Scrollable Grid
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Adjust based on screen size
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1, // Square items
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return _buildGridItem(index);
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

  Widget _buildGridItem(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
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
      child: Center(
        child: Text(
          "Trend ${index + 1}",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
