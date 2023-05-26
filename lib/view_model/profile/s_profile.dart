import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class SProfile extends StatefulWidget {
  const SProfile({Key? key}) : super(key: key);

  @override
  State<SProfile> createState() => _SProfileState();
}

class _SProfileState extends State<SProfile> {
  QuerySnapshot snapshot = FirebaseFirestore.instance.collection("users").get() as QuerySnapshot<Object?>;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.active){
              if(snapshot.hasData && snapshot.data != null){
               return Expanded(
                 child: ListView.builder(
                     itemCount: snapshot.data!.docs.length,
                     itemBuilder:(context,index){
                       Map<String,dynamic> userMap =snapshot.data!.
                       docs[index].data() as Map <String,dynamic>;
                       return ListTile(
                         title: Text(userMap['name']),
                         subtitle: Text(userMap['email']),
                       );
                     }
                 ),
               );
              }
              else{
                return Text("no data");
              }
            }
            else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

