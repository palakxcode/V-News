// registration_form.dart
import 'package:flutter/material.dart';

class RegistrationFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Registration'),
      ),
      body: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  late String regnum, name, course, branch, mail, passwd;
  String? gender, accommodation; // Define your form fields here

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Reg No.'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your reg number';
              }
              return null;
            },
            onSaved: (value) => regnum = value ?? '',
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your name';
              }
              return null;
            },
            onSaved: (value) => name = value ?? '',
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Course'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your course';
              }
              return null;
            },
            onSaved: (value) => course = value ?? '',
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Branch'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your branch';
              }
              return null;
            },
            onSaved: (value) => branch = value ?? '',
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'VIT Mail'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your VIT Mail';
              }
              return null;
            },
            onSaved: (value) => mail = value ?? '',
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Create Password'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please create your password for V-News';
              }
              return null;
            },
            onSaved: (value) => passwd = value ?? '',
          ),
          DropdownButtonFormField(
            items: ['Male', 'Female'].map((String gender) {
              return DropdownMenuItem(value: gender, child: Text(gender));
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                gender = newValue;
              });
            },
            decoration: InputDecoration(labelText: 'Gender'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please select your gender';
              }
              return null;
            },
            onSaved: (value) {
              gender = value ?? '';
            },
          ),
          DropdownButtonFormField(
            items: ['Hosteller', 'DayScholar'].map((String accommodation) {
              return DropdownMenuItem(
                  value: accommodation, child: Text(accommodation));
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                accommodation = newValue;
              });
            },
            decoration: InputDecoration(labelText: 'Accommodation'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please select your accommoadtion type';
              }
              return null;
            },
            onSaved: (value) {
              accommodation = value ?? '';
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
