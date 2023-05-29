import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../services/data_fetch.dart';
class GlobalComplain extends StatelessWidget {
  const GlobalComplain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Complain".text.make(),
      ),
      body: Material(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                color: Colors.green.shade300,
                child: ListTile(
                  title:Text("\nStudent complain here\n",style: TextStyle(color: Colors.white),textScaleFactor: 1,),
                  subtitle:Text(e1.name+"\n"+e1.room,style: TextStyle(color: Colors.white),textScaleFactor: 1,),
                ),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}

