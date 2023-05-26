import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/view_model/dashboard/student_dashboard.dart';
import 'package:flutter_container/view_model/services/data_fetch.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Center(
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.6),
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: e1.image.toString()== "" ?Icon(Icons.person,size: 35,):Image.asset(e1.image,
                    fit: BoxFit.fill,
                    errorBuilder:(context,object,stack){
                      return Container(
                        child:Icon(Icons.error_outline,color:Colors.redAccent,),
                      );
                    },
                    ),

                  ),
                ),
              ),
              SizedBox(height: 20,),
              ReusableRow(title:"Username",value:e1.name, iconData:Icons.person_outline),
              ReusableRow(title:"Phone",value:e1.phone, iconData:Icons.phone_outlined),
              ReusableRow(title:"Email",value:e1.email, iconData:Icons.email_outlined),
            ],
          ),
        ),
      ),
    );
  }
  }
class ReusableRow extends StatelessWidget {
  final String title,value;
  final IconData iconData;
  const ReusableRow({Key? key, required this.title, required this.value, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title,style: const TextStyle(color:Colors.black,fontSize:(16))),
          leading: Icon(iconData,color: Colors.black,),
          trailing: Text(value,style:const TextStyle(color:Colors.black,fontSize:(16))),
        ),
         Divider(color: Colors.grey.withOpacity(1)),
      ],
    );
  }
}

          // return Scaffold(
          //   appBar: AppBar(
          //     title: const Text("Profile"),
          //   ),
          //   body: Material(
          //     child: Column(
          //       children: [
          //         Container(
          //           width: MediaQuery.of(context).size.width,
          //           height:150,
          //           color: Colors.orangeAccent,
          //           child: SingleChildScrollView(
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.end,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 Padding(
          //                   padding: const EdgeInsets.only(top: 20),
          //                   child: Text(e1.name),
          //                   // child: Text("Mickey",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textScaleFactor: 1.7,),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //         // ==========student detail section start form here==============
          //         SizedBox(
          //           width: 300,
          //           height: 600,
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //                Padding(
          //                 padding: const EdgeInsets.only(top: 20),
          //                 child: Column(
          //                   children: [
          //                     //=====student userId here============
          //                     Row(
          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         const Text("Enrollment No :",textScaleFactor: 1,),
          //                         const SizedBox(
          //                           width: 15,
          //                         ),
          //                         Text(e1.regNo,textScaleFactor: 1,),
          //                       ],
          //                     ),
          //                     //=====student Contact here============
          //                     Row(
          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         const Text("Contact :",textScaleFactor: 1,),
          //                         const SizedBox(
          //                           width: 15,
          //                         ),
          //                         Text(e1.phone,textScaleFactor: 1,),
          //                       ],
          //                     ),
          //                     //=====student RoomNo here============
          //                     Row(
          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         const Text("Room no :",textScaleFactor: 1,),
          //                         const SizedBox(
          //                           width: 15,
          //                         ),
          //                         Text(e1.room,textScaleFactor: 1,),
          //                       ],
          //                     ),
          //
          //                     Row(
          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         const Text("Course :",textScaleFactor: 1,),
          //                         const SizedBox(
          //                           width: 15,
          //                         ),
          //                         Text(e1.course,textScaleFactor: 1,),
          //                       ],
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               SizedBox(
          //                 width: MediaQuery.of(context).size.width,
          //                 child: ElevatedButton(onPressed: (){
          //                   Navigator.of(context).pop();
          //                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const StudentDashboardPage()));
          //                 }, child: const Text("Close")),
          //               )
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // );


