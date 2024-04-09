import 'package:flutter/material.dart';
import 'dart:math';

class VoicesVotesContent extends StatefulWidget {
  @override
  _VoicesVotesContentState createState() => _VoicesVotesContentState();
}

class _VoicesVotesContentState extends State<VoicesVotesContent> {
  List<Poll> polls = [];

  void _addPoll() {
    // Function to show dialog and add a poll
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Variables to hold form data
        String question = '';
        List<String> options = ['', ''];

        return AlertDialog(
          title: Text('Create a New Poll'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Enter poll question'),
                  onChanged: (value) {
                    question = value;
                  },
                ),
                ...options.map((option) {
                  return TextField(
                    decoration: InputDecoration(hintText: 'Enter an option'),
                    onChanged: (value) {
                      options[options.indexOf(option)] = value;
                    },
                  );
                }).toList(),
                ElevatedButton(
                  child: Text('Add Option'),
                  onPressed: () {
                    setState(() {
                      options.add('');
                    });
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                if (question.isNotEmpty &&
                    options.every((option) => option.isNotEmpty)) {
                  setState(() {
                    polls.add(Poll(question: question, options: options));
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: polls.length,
        itemBuilder: (context, index) {
          return PollCard(poll: polls[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPoll,
        tooltip: 'Create New Poll',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Poll {
  String question;
  List<String> options;
  Map<String, int> votes;
  bool isOpen;

  Poll({required this.question, required this.options})
      : votes = Map.fromIterable(options, key: (e) => e, value: (e) => 0),
        isOpen = true;
}

class PollCard extends StatelessWidget {
  final Poll poll;

  PollCard({required this.poll});

  @override
  Widget build(BuildContext context) {
    // Determine the option with the maximum votes
    String leadingOption = poll.votes.keys.isNotEmpty
        ? poll.votes.keys.firstWhere(
            (key) => poll.votes[key] == poll.votes.values.reduce(max),
            orElse: () =>
                poll.options.first, // Provide a default non-null String value
          )
        : poll.options.first; // Default value if no votes are present

    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(poll.question),
            subtitle: poll.isOpen ? Text('Vote Now') : Text('Closed'),
          ),
          ...poll.options.map((option) => ListTile(
                title: Text(option),
                leading: Radio(
                  value: option,
                  groupValue: leadingOption,
                  onChanged: poll.isOpen
                      ? (String? value) {
                          // Handle vote logic
                        }
                      : null,
                ),
              )),
          poll.isOpen
              ? ElevatedButton(
                  onPressed: () {
                    // Handle close poll logic
                  },
                  child: Text('Close Poll'),
                )
              : Container(),
        ],
      ),
    );
  }
}
