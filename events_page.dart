import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        EventCard(
          title: 'Live Event: Flutter Workshop',
          description: 'Join us for an interactive Flutter workshop!',
          isLive: true,
        ),
        EventCard(
          title: 'Upcoming Event: Hackathon',
          description: 'Get ready for the V-NEWS Hackathon!',
          isLive: false,
        ),
        // Add more event cards as needed
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isLive;

  EventCard({
    required this.title,
    required this.description,
    required this.isLive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          ListTile(
            title: Text(title),
            subtitle: Text(description),
            trailing: Icon(
              isLive ? Icons.live_tv : Icons.schedule,
              color:
                  isLive ? const Color.fromARGB(255, 17, 112, 21) : Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
