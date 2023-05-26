import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/view_model/dashboard/admin_dashboard.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  void login() async{
    String email =emailController.text.trim();
    String password =passwordController.text.trim();
    if(email == "" || password==""){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields !"),),
      );
    }
    else{
      try{
        UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        if(userCredential.user != null){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AdminDashboard()));
        }
      }on FirebaseAuthException catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.code.toString()),),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Hostel App"),
      ),
      body: Material(
        child: SingleChildScrollView(
          child: Form(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3.7,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text("Hostel Complain System",
                                    style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                                    textScaleFactor: 1.3,
                                  ),
                                ),
                                Image.asset("assets/images/university-logo.png", width: 300, height: 200,),
                              ],
                            ),
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20 * 2.5),
                              topRight: Radius.circular(20 * 2.5),
                            )),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const Column(
                                children: [
                                  Padding(padding: EdgeInsets.only(top: 20),
                                    child: Text("Admin Login", style: TextStyle(fontSize: 30),),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 50,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                                child: Column(
                                  children: [
                                    //=========Login Id input here============
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width / 1.1,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              controller: emailController,
                                              decoration: const InputDecoration(
                                                  hintText: "Enter UserId",
                                                  labelText: "User_Id",
                                                  labelStyle: TextStyle(fontSize: 20),
                                                  prefixIcon: Icon(Icons.mail)),
                                            ),
                                            const SizedBox(height: 10,),
                                            //=======Login Password input here=========
                                            TextFormField(
                                              obscureText: true,
                                              controller: passwordController,
                                              decoration: const InputDecoration(
                                                  hintText: "Enter Password",
                                                  labelText: "Password",
                                                  labelStyle: TextStyle(fontSize: 20),
                                                  prefixIcon: Icon(Icons.no_encryption_gmailerrorred)),
                                            ),
                                            const SizedBox(height: 50,),
                                            CupertinoButton(onPressed:(){
                                              login();
                                            },
                                              color: Colors.blue.shade300,child:"Login".text.make(),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
