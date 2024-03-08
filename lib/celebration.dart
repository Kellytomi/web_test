import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class CelebrationPage extends StatelessWidget {
  final bool isYes;
  CelebrationPage({required this.isYes});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      const url = 'https://open.spotify.com/playlist/5DgCfnfTrO7zrNpXYwHn9U?si=dda6466205b84f14';
      launch(url);
    });

    return Scaffold(
      body: Stack(
        children: [
          // GIF as background
          Positioned.fill(
            child: Image.asset(
              'assets/puppy.gif', // Replace with your GIF path
              fit: BoxFit.cover,
            ),
          ),

          // Celebration/rejection content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isYes ? 'Yayyyyyy' : 'Rejection Text',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Add more celebration/rejection content as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
