import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/component/roundbutton.dart';
import 'package:flutter_container/component/sign_controller.dart';
import 'package:velocity_x/velocity_x.dart';
class Complain extends StatelessWidget {
   Complain({super.key});

  final postController=TextEditingController();
  bool loading = false;
  final databaseRef=FirebaseDatabase.instance.ref('complains');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:"Complain".text.letterSpacing(1).scale(1.5).make()),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:20),
          child: Column(
            children: [
              const SizedBox(height: 30,),
              TextFormField(
                maxLines: 8,
                controller:postController,
                decoration: const InputDecoration(
                  hintText: "Write your complain here !",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20,),
              RoundButton(
                title: 'Send',
                loading: loading,
                onPress: () {
                  String id=DateTime.now().millisecondsSinceEpoch.toString();
                  databaseRef.child(id).set({
                    'title': postController.text.toString(),
                  });
                  // fireStore.doc(id).set({
                  //   'title':postController.text.toString(),
                  //   'id':id
                  // }).then((value){
                  //
                  // }).onError((error, stackTrace){
                  //   SignController.toastMessage(error.toString());
                  // });
                },

              )
            ],
          ),
        ),
      ),
    );
  }
}
