import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  // Dummy data for live and upcoming events
  final List<Map<String, dynamic>> liveEvents = [
    {
      'logo': 'assets/my_logo.png',
      'name': 'Tech Talk',
      'location': 'Auditorium A',
    },
    // Add more live events here
  ];
  final List<Map<String, dynamic>> upcomingEvents = [
    {
      'logo': 'assets/club2_logo.png',
      'name': 'Art Workshop',
      'club': 'Art Club',
      'venue': 'Room 101',
      'date': 'April 15, 2024',
      'time': '10:00 AM',
    },
    // Add more upcoming events here
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Live Events',
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        ...liveEvents.map((event) => ListTile(
              leading: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage(event['logo']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(event['name']),
              subtitle: Text(event['location']),
              isThreeLine: true,
            )),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Upcoming Events',
              style: Theme.of(context).textTheme.headline5),
        ),
        ...upcomingEvents.map((event) => ExpansionTile(
              leading: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage(event['logo']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text('${event['name']} - ${event['club']}'),
              children: <Widget>[
                ListTile(
                  title: Text('Venue: ${event['venue']}'),
                  subtitle: Text('Date: ${event['date']} at ${event['time']}'),
                ),
              ],
            )),
      ],
    );
  }
}
