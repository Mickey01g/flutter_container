import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/utils/routes_name.dart';
class AdminDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black38,
      child: Container(
          margin: EdgeInsets.only(top: 0),
       child: ListView(
         children: [
             DrawerHeader(
               padding: EdgeInsets.zero,
                     child: UserAccountsDrawerHeader(
                        accountName: Text("Warden",textScaleFactor: 2,),accountEmail: null,
               ),
             ),
           // ==========profile section start here===========
           ListTile(
             leading: Icon(
               CupertinoIcons.profile_circled,
               color:Colors.amber,
             ),
             title: Text("Profile",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
             onTap:(){
               Navigator.pushNamed(context,RouteName.adminprofile);
             }
           ),
            // ==========About section start here===========
           ListTile(
             leading: Icon(
               Icons.help_outline,
               color:Colors.amber,
             ),
             title: Text("About",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
             onTap: null,
           ),
           // ==========Suppport section start here===========
           ListTile(
             leading: Icon(
               CupertinoIcons.bubble_left_bubble_right,
               color:Colors.amber,
             ),
             title: Text("Support",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
             onTap: null,
           ),
           // ==========Version section start here===========
           ListTile(
             leading: Icon(
               Icons.adb_outlined,
               color:Colors.amber,
             ),
             title: Text("Version",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
             onTap: null,
           )
         ],
       ),
      ),
    );
  }
}

