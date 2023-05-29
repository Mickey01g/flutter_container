import 'package:flutter/material.dart';
import 'package:flutter_container/view_model/login/admin_login.dart';
import 'package:velocity_x/velocity_x.dart';

import '../services/data_fetch.dart';
class AnnouncementView extends StatelessWidget {
  const AnnouncementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Announcement".text.make(),
      ),
      body: Material(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                color: Colors.green.shade300,
                child: ListTile(
                  title:const Text("\nAnnouncement For Student\n",style: TextStyle(color: Colors.white),textScaleFactor: 1,),
                  subtitle:Text(admin.name+"\n"+admin.role,style: TextStyle(color: Colors.white),textScaleFactor: 1,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

