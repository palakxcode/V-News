import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ClubsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ClubCard(
          clubName: 'Coding Club',
          logoUrl: 'assets/coding_club_logo.png', // Add your club logo image
          applyLink:
              'https://www.linkedin.com/in/palak-ramani-a3b147286/', // Update with the LinkedIn link
          onPressedResults: () {
            // Handle "Results" button press
            // You can navigate to the results page or perform any other action
          },
        ),
        // Add more club cards as needed
      ],
    );
  }
}

class ClubCard extends StatelessWidget {
  final String clubName;
  final String logoUrl;
  final String applyLink;
  final VoidCallback onPressedResults;

  ClubCard({
    required this.clubName,
    required this.logoUrl,
    required this.applyLink,
    required this.onPressedResults,
  });

  // Function to launch the apply link
  _launchApplyLink() async {
    if (await canLaunch(applyLink)) {
      await launch(applyLink);
    } else {
      // Handle error (e.g., show an error message)
      print('Error launching link: $applyLink');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          ListTile(
            title: Text(clubName),
            leading: Image.asset(logoUrl), // Display club logo
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _launchApplyLink,
                child: Text('Apply Now'),
              ),
              ElevatedButton(
                onPressed: onPressedResults,
                child: Text('Results'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
