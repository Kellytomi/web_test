import 'package:flutter/material.dart';
import 'celebration.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'For Angel',
      home: ProposalPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProposalPage extends StatefulWidget {
  @override
  _ProposalPageState createState() => _ProposalPageState();
}

class _ProposalPageState extends State<ProposalPage> {
  int noButtonClickCount = 0;

  final List<String> noButtonTexts = [
    'No',
    'You Sure?',
    'Pookie Please',
    'One Last Chance',
    'Okay Fine'
  ];

  @override
  Widget build(BuildContext context) {
    double yesButtonWidth = 150 + noButtonClickCount * 10;
    double yesButtonHeight = 50 + noButtonClickCount * 5;

    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Place your question text here
            Text(
              'Will you be my Valentine?',
              style: GoogleFonts.montserrat(
                color: Colors.red,
                fontSize: 24,
              ),
            ),

            SizedBox(height: 20),

            // Your GIF will go here
            Image.asset(
                'assets/be mine.gif'), // Adjust the path as per your project structure

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CelebrationPage(isYes: true),
                      ),
                    );
                  },
                  child: Text(
                    'Yes',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18 + noButtonClickCount * 2,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(yesButtonWidth, yesButtonHeight),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      noButtonClickCount =
                          (noButtonClickCount + 1) % noButtonTexts.length;
                    });
                  },
                  child: Text(
                    noButtonTexts[noButtonClickCount],
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
