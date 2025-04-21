import 'package:flutter/material.dart';
import 'trends_screen.dart';
import 'events_screen.dart';

class ForYouScreen extends StatefulWidget {
  const ForYouScreen({super.key});

  @override
  _ForYouScreenState createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen> {
  late ScrollController _scrollController;
  bool _showGoUpButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset > 300 && !_showGoUpButton) {
      setState(() {
        _showGoUpButton = true;
      });
    } else if (_scrollController.offset <= 300 && _showGoUpButton) {
      setState(() {
        _showGoUpButton = false;
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF4D3),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Title Image
                Image.asset(
                  'assets/images/title.png',
                  width: 250,
                ),

                const SizedBox(height: 10),

                // Navigation Bar
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
                  child: Row(
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
                ),

                const SizedBox(height: 10),

                // Multiple Video Players
                Column(
                  children: List.generate(
                    5, // Number of videos
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: _buildVideoPlayer(index + 1),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // "Go to Top" Button
          if (_showGoUpButton)
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: _scrollToTop,
                backgroundColor: const Color(0xFF073B3A),
                child: const Icon(Icons.arrow_upward, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  // Function to Build Video Players
  Widget _buildVideoPlayer(int index) {
    return Container(
      height: 400,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.black,
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
      child: Stack(
        children: [
          // Centered "Video" Text
          Center(
            child: Text(
              "Video Player $index Coming Soon",
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),

          // Vertical Icons on the Right Side
          Positioned(
            right: 10,
            top: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIcon(Icons.favorite_border), // Heart
                _buildIcon(Icons.comment), // Comment
                _buildIcon(Icons.share), // Share Link
                _buildIcon(Icons.bookmark_border), // Bookmark
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to Build Navigation Icons
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

  // Function to Build Video Icons
  Widget _buildIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Icon(icon, color: Colors.white, size: 28),
    );
  }
}
