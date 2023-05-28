import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/view_model/dashboard/student_dashboard.dart';
import 'package:flutter_container/view_model/services/data_fetch.dart';
import '../../utils/routes_name.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}
class _StudentProfileState extends State<StudentProfile> {

  final Stream<QuerySnapshot> userData =
  FirebaseFirestore.instance.collection("users").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        automaticallyImplyLeading: false,
      ),
      body: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 150,
                color: Colors.orangeAccent,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(e1.name),
                        // child: Text("Mickey",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textScaleFactor: 1.7,),
                      ),
                    ],
                  ),
                ),
              ),
              // ==========student detail section start form here==============
              SizedBox(
                width: 300,
                height: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          //=====student userId here============
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Enrollment No :", textScaleFactor: 1,),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(e1.regNo, textScaleFactor: 1,),
                            ],
                          ),
                          //=====student Contact here============
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Contact :", textScaleFactor: 1,),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(e1.phone, textScaleFactor: 1,),
                            ],
                          ),
                          //=====student RoomNo here============
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Room no :", textScaleFactor: 1,),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(e1.room, textScaleFactor: 1,),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Course :", textScaleFactor: 1,),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(e1.course, textScaleFactor: 1,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: ElevatedButton(onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, RouteName.studentdashboard);
                      }, child: const Text("Close")),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
