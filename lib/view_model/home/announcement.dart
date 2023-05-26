import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class Announcement extends StatelessWidget {
  const Announcement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: "Announcement".text.make(),
      ),
      body: Material(
        child:Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              child: TextField(
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
