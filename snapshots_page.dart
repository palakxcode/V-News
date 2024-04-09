import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SnapshotsPage extends StatefulWidget {
  @override
  _SnapshotsPageState createState() => _SnapshotsPageState();
}

class _SnapshotsPageState extends State<SnapshotsPage> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Use the selected image file
      // For example, you can upload the image or use it in your UI
    } else {
      // Handle the case when no image is selected
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Your SnapshotCards...
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: 'Upload Photo',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

// Your SnapshotCard widget remains unchanged.
