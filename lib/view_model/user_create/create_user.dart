import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/component/roundbutton.dart';
import 'package:flutter_container/component/sign_controller.dart';
class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final buttonFocusNode=FocusNode();

  final FirebaseFirestore _fs = FirebaseFirestore.instance.collection("users") as FirebaseFirestore;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false;
  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<void> createUser() async {
    try {
      setState(() {
        isLoading = true;
      });
      await _auth
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((UserCredential user) async {
        // SessionController().userId=value.user!.uid.toString();
        try {
          await _fs.collection('users').doc(user.user?.uid).set({
            'email': emailController.text,
            'password': passwordController.text,
          }).then((value) {
            setState(() {
              isLoading = false;
            });
          });
        } catch (err) {
          user.user?.delete();
          if (kDebugMode) {
            SignController.toastMessage("User Deleted");
          }
          setState(() {
            isLoading = false;
          });
        }
      });
    } catch (err) {
      SignController.toastMessage("Cannot Sign Up: $err");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child:Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(controller: emailController,),
                      const SizedBox(height: 20,),
                      TextField(controller: passwordController,),
                      const SizedBox(height: 20,),
                      RoundButton(title: 'Create User', onPress:(){
                        CreateUser();
                      }, loading: isLoading,),
                      TextButton(
                          onPressed: () {Navigator.pop(context);},
                          child: const Text("Delete User",style: TextStyle(fontSize: 18)))
                    ],
                  ),
                    )
        ),

      ),
    );
  }
}


