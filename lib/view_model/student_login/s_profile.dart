// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_container/component/sign_controller.dart';
// class SProfile extends StatelessWidget {
//    SProfile({Key? key}) : super(key: key);
//
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//   final Stream<QuerySnapshot> studentsData = FirebaseFirestore.instance.collection("users").snapshots();
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(future:_initialization,
//         builder:(context,snaphot){
//       if(snaphot.hasError){
//         SignController.toastMessage("Something Went Wrong");
//       }
//       if(snaphot.connectionState==ConnectionState.done){
//         return StreamBuilder<QuerySnapshot>(
//           stream: studentsData,
//           builder: (
//               BuildContext context,
//               AsyncSnapshot<QuerySnapshot> snapshot){
//             if(snaphot.hasError){
//               SignController.toastMessage("Something Went Wrong");
//         }
//             if(snaphot.connectionState== ConnectionState.waiting){
//               return Center(child: CircularProgressIndicator(),
//               );
//         }
//             final List storedocs =[];
//             snaphot.data!.docs.map((DocumentSnapshot document){
//               Map a=document.data() as Map<String,dynamic>;
//               storedocs.add(a);
//             });
//
//             return Scaffold(
//
//             );
//
//         },
//         );
//       }
//       return CircularProgressIndicator();
//         }
//     );
//   }
// }
//
