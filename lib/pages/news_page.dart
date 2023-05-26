import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
class NewsPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Hostel Announcement"),
      ),
      body: Material(
        child: Container(
          child: Center(
            child: ElevatedButton(
              onPressed:  null,
              child: Text("PDF GET"),

            ),
          ),
        ),
      ),
    );
  }
}

