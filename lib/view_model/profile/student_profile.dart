import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/component/sign_controller.dart';
import 'package:flutter_container/view_model/dashboard/student_dashboard.dart';

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
    return StreamBuilder<QuerySnapshot>(
      stream: userData,
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot>snapshot){
        if(snapshot.hasError){
          SignController.toastMessage("Something Went Wrong");
        }
        if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List storeData=[];
          snapshot.data!.docs.map((DocumentSnapshot document){
            Map a=document.data() as Map<String,dynamic>;
            storeData.add(a);
            if (kDebugMode) {
              print(storeData);
            }
          }).toList();

          return Scaffold(
            appBar: AppBar(
              title:const Text("Profile"),
            ),
            body: Material(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height:150,
                    color: Colors.orangeAccent,
                    child: const SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text("Mickey",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textScaleFactor: 1.7,),
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
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              //=====student userId here============
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("UserId :",textScaleFactor: 1,),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text("CSJMA2000130XXXX",textScaleFactor: 1,),
                                ],
                              ),
                              //=====student Contact here============
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Contact :",textScaleFactor: 1,),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text("90441529XX",textScaleFactor: 1,),
                                ],
                              ),
                              //=====student RoomNo here============
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Room no :",textScaleFactor: 1,),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text("C-102",textScaleFactor: 1,),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Course :",textScaleFactor: 1,),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text("BCA III",textScaleFactor: 1,),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(onPressed: (){
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const StudentDashboardPage()));
                          }, child: const Text("Close")),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );

  }
}

