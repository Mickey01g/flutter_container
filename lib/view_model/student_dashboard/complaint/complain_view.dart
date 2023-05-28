import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../services/data_fetch.dart';
class ComplainView extends StatelessWidget {
  const ComplainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Track Complain".text.make(),
      ),
      body: Material(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                color: Colors.green.shade300,
                child: ListTile(
                  title:Text(e1.name,style: TextStyle(color: Colors.white),),
                  subtitle:Text(e1.room,style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}

