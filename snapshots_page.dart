import 'package:flutter/material.dart';

class SnapshotsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SnapshotCard(
          title: 'Beautiful Sunset',
          imageUrl: 'assets/sunset.jpg', // Add your snapshot image
        ),
        SnapshotCard(
          title: 'Sunrise at the Beach',
          imageUrl: 'assets/sunrise_beach.jpg', // Add another snapshot image
        ),
        SnapshotCard(
          title: 'City Lights',
          imageUrl: 'assets/city_lights.jpg', // Add another snapshot image
        ),
        SnapshotCard(
          title: 'Mountain Peaks',
          imageUrl: 'assets/mountain_peaks.jpg', // Add another snapshot image
        ),
        SnapshotCard(
          title: 'Starry Night',
          imageUrl: 'assets/starry_night.jpg', // Add another snapshot image
        ),
        // Add more snapshot cards as needed
      ],
    );
  }
}

class SnapshotCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  SnapshotCard({
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          AspectRatio(
            aspectRatio: 1.0, // Make the image square
            child: Image.asset(imageUrl), // Display snapshot image
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.thumb_up),
              Icon(Icons.thumb_down),
              Icon(Icons.comment),
            ],
          ),
        ],
      ),
    );
  }
}
