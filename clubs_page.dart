import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ClubsPage extends StatefulWidget {
  @override
  _ClubsPageState createState() => _ClubsPageState();
}

class _ClubsPageState extends State<ClubsPage> {
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                _searchText = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              // Filter the ClubCard widgets based on the search text
              if (_searchText.isEmpty || 'Coding Club'.contains(_searchText))
                ClubCard(
                  clubName: 'Coding Club',
                  logoUrl: 'assets/my_logo.png', // Add your club logo image
                  applyLink:
                      'https://www.linkedin.com/in/palak-ramani-a3b147286/', // Update with the LinkedIn link
                  onPressedResults: () {
                    // Handle "Results" button press
                    // You can navigate to the results page or perform any other action
                  },
                ),
              // Add more club cards as needed
            ],
          ),
        ),
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
  void _launchApplyLink() async {
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
      child: InkWell(
        onTap: () {
          // Navigate to club details screen on tap
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClubDetailsScreen(
                clubName: clubName,
                applyLink: applyLink,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                clubName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset(
              logoUrl,
              width: 100, // Adjust size as needed
              height: 100, // Adjust size as needed
            ),
          ],
        ),
      ),
    );
  }
}

class ClubDetailsScreen extends StatelessWidget {
  final String clubName;
  final String applyLink;

  ClubDetailsScreen({required this.clubName, required this.applyLink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(clubName),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/my_logo.png', // Replace with the actual logo URL
              width: 100,
              height: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Club Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Join the strategic minds with our Coding Club.', // Replace with the actual club description
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle "Apply Now" button press
                _launchApplyLink();
              },
              child: Text('Apply Now'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text('Results'),
            ),
          ],
        ),
      ),
    );
  }

  void _launchApplyLink() async {
    if (await canLaunch(applyLink)) {
      await launch(applyLink);
    } else {
      // Handle error (e.g., show an error message)
      print('Error launching link: $applyLink');
    }
  }
}
