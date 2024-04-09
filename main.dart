import 'package:flutter/material.dart';
import 'prime_page.dart';
import 'events_page.dart';
import 'clubs_page.dart';
import 'snapshots_page.dart';
import 'voice_votes_page.dart';
import 'login_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'registration_form.dart';

void main() => runApp(VNewsApp());

class VNewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'V-NEWS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class VNewsHomePage extends StatefulWidget {
  @override
  _VNewsHomePageState createState() => _VNewsHomePageState();
}

class _VNewsHomePageState extends State<VNewsHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    PrimePage(),
    EventsPage(),
    ClubsPage(),
    SnapshotsPage(),
    VoicesVotesContent(),
    RegistrationFormPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('V-NEWS')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RegistrationFormPage()));
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fiber_new),
            label: 'PRIME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'EVENTS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'CLUBS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'SNAPSHOT',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.poll),
            label: 'VOICES & VOTES',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        selectedIconTheme: IconThemeData(
          size: 35,
          color: Colors.amber[800],
        ),
        onTap: _onItemTapped,
      ),
    );
  }
}
