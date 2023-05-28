
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/view_model/drawer/admin_drawer.dart';
import 'package:flutter_container/view_model/admin_dashboard/create_announcement.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_container/view_model/user_create/createuser.dart';
import '../../utils/routes_name.dart';
import '../services/session_manager.dart';



class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Admin Dashboard"),
        actions:[
          IconButton(onPressed:() async {
            FirebaseAuth.instance.signOut();
            // SharedPreferences sp= await SharedPreferences.getInstance();
            // sp.clear();
            SessionController().userId = '' ;
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context,RouteName.homepage);
          }, icon:const Icon(Icons.login_outlined)),
        ],
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
                                        onPressed: () {
                                          createAllUsers();
                                        },
                                        child: const Text("Create User",
                                            style: TextStyle(fontSize: 18))),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Delete User",
                                            style: TextStyle(fontSize: 18)))
                                  ],
                                ),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 41, vertical: 65),
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
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
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
                  onPressed: () {
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
                        builder: (context) =>Announcement()));
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
}