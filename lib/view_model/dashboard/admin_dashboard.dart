import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_container/view_model/firebase_file/firebase_options.dart';
import 'package:flutter_container/view_model/drawer/admin_drawer.dart';
import 'package:flutter_container/view_model/home/announcement.dart';
import 'package:velocity_x/velocity_x.dart';



class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Admin Dashboard"),
      ),
      drawer: AdminDrawer(),
      body: Material(
        child: Column(
          children: [
            const SizedBox(height: 25,),
            //========upper button here============
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //===========give permission by admin start here===========
                CupertinoButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Make User"),
                            actions: [
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {Navigator.pop(context);},
                                        child: const Text("Create User",
                                            style: TextStyle(fontSize: 18))),
                                    TextButton(
                                        onPressed: () {Navigator.pop(context);},
                                        child: const Text("Delete User",style: TextStyle(fontSize: 18)))
                                  ],
                                ),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 41, vertical: 65),
                  child: "Create User".text.color(Colors.white).make(),
                ),
                //=========announcement start here ==================
                CupertinoButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Announcement"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Close"))
                            ],
                          );
                        });
                  },
                  color: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 31, vertical: 65),
                  child: "Announcement".text.color(Colors.white).make(),
                ),
                //=========announcement end here ==================
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupertinoButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: AlertDialog(
                              title: const Text("Complaint"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Close"))
                              ],
                            ),
                          );
                        });
                  },
                  color: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 23, vertical: 65),
                  child: "Student Complain".text.color(Colors.white).make(),
                ),
                CupertinoButton(
                  onPressed: (){
                    null;
                  },
                  color: Colors.blue,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 44, vertical: 65),
                  child: "Upload File".text.color(Colors.white).make(),
                ),
              ],
            ),
            //  =================Student complaint start here ==============
            //========upper button end here============
            //========Create announcement start button here============
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: CupertinoButton(
                  color: Colors.blue,
                  onPressed: () {

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Announcement()));
                  },
                  child: const Text(
                    "Create Announcement",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
  void exportData () async{
    final CollectionReference users=FirebaseFirestore.instance.collection("users");
    final myData =await rootBundle.loadString("assets/");
    List<List<dynamic>> csvTable =const CsvToListConverter().convert(myData);
    List<List<dynamic>> data;[];
    data = csvTable;
    for(var i=0;i<data.length;i++){
      var record ={
        // "name" =data[i][0],
      };
      users.add(record);
    }
  }
}
