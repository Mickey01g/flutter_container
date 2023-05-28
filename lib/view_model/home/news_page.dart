import 'package:flutter/material.dart';
import 'package:flutter_container/view_model/user_create/createuser.dart';

import '../announcement_create/create_announcement.dart';
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
              onPressed:(){
                // createAllUsers();
                // DoGet().createAnnouncement("data");
                DoGet().complaint("sdfkjllsadf","sdf","fdsfsd","sdsdg","hjjhd");
              },
              child: Text("PDF GET"),

            ),
          ),
        ),
      ),
    );
  }
}

