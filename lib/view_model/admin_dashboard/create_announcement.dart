import 'package:flutter/material.dart';
import 'package:flutter_container/view_model/announcement_create/create_announcement.dart';
import 'package:velocity_x/velocity_x.dart';




class Announcement extends StatefulWidget {
   Announcement({Key? key}) : super(key: key);

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  final myController = TextEditingController();
  @override
  void dispose(){
    super.dispose();
    myController.clear();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: "Announcement".text.make(),
      ),
      body: Material(
        child:Column(
          children: [
             Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                    labelText: "Description",
                    labelStyle: TextStyle(fontSize: 18),
                    hintText: "Write your Announcement here !"),

                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: 5,

              ),
            ),
            SizedBox(height: 100,),
            ElevatedButton(onPressed:(){
              DoGet().createAnnouncement(myController.text);
              Navigator.of(context).pop();
            },
              child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2,
                textAlign: TextAlign.center,
              ),
            ),)
          ],
        )
      ),
    );
  }
}
