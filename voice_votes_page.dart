import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';

class VoicesVotesContent extends StatefulWidget {
  @override
  _VoicesVotesContentState createState() => _VoicesVotesContentState();
}

class _VoicesVotesContentState extends State<VoicesVotesContent> {
  void _showPollCreationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Create a Poll"),
          content: PollCreationForm(),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
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
      body: Center(child: Text('Voices & Votes Content')),
      floatingActionButton: FloatingActionButton(
        onPressed: _showPollCreationDialog,
        tooltip: 'Create Poll',
        child: Icon(Icons.add),
      ),
    );
  }
}

class PollCreationForm extends StatefulWidget {
  @override
  _PollCreationFormState createState() => _PollCreationFormState();
}

class _PollCreationFormState extends State<PollCreationForm> {
  final _formKey = GlobalKey<FormState>();
  String _question = '';
  List<String> _options = ['', ''];

  void _addOption() {
    setState(() {
      _options.add('');
    });
  }

  void _removeOption(int index) {
    setState(() {
      _options.removeAt(index);
    });
  }

  void _submitPoll() {
    if (_formKey.currentState!.validate()) {
      // Process data.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Question'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter a question';
              }
              return null;
            },
            onSaved: (value) {
              _question = value ?? '';
            },
          ),
          ..._options
              .asMap()
              .map((index, option) {
                return MapEntry(
                  index,
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Option ${index + 1}',
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter an option';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _options[index] = value ?? '';
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () => _removeOption(index),
                      ),
                    ],
                  ),
                );
              })
              .values
              .toList(),
          Row(
            children: <Widget>[
              TextButton(
                child: Text('Add Option'),
                onPressed: _addOption,
              ),
              Spacer(),
              ElevatedButton(
                child: Text('Submit Poll'),
                onPressed: _submitPoll,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
