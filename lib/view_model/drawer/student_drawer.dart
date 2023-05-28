import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/view_model/profile/student_profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import '../services/data_fetch.dart';
import '../services/session_manager.dart';

class StudentDrawer extends StatelessWidget {
  const StudentDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.black38,
        child: Container(
          margin: const EdgeInsets.only(top: 0),
          child: ListView(
            children: [
               DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text(e1.name,textScaleFactor:1.6,), accountEmail: Text(e1.email),

                ),
              ),
              ListTile(
                // ==========profile section start here===========
                leading: const Icon(
                  CupertinoIcons.profile_circled,
                  color:Colors.amber,
                ),
                title: const Text("Profile",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
                onTap: (){
                  Navigator.of(context).pop;
                  Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) =>const StudentProfile(), ));
                },
              ),
              // ==========share section start here===========
              const ListTile(
                leading: Icon(
                  CupertinoIcons.share_up,
                  color:Colors.amber,
                ),
                title: Text("Share",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
              ),
              // ==========Support section start here===========
              const ListTile(
                leading: Icon(
                  CupertinoIcons.bubble_left_bubble_right,
                  color:Colors.amber,
                ),
                title: Text("Support",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
              ),
              // ==========Version section start here===========
              ListTile(
                leading: const Icon(
                  Icons.adb_outlined,
                  color:Colors.amber,
                ),
                title: const Text("Version",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
                subtitle: "1.0.0".text.color(Colors.white).letterSpacing(2).make(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

