import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/utils/routes_name.dart';
import 'package:flutter_container/view_model/login/admin_login.dart';
import 'package:velocity_x/velocity_x.dart';
class AdminDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.black38,
        child: Container(
            margin: EdgeInsets.only(top: 0),
         child: ListView(
           children: [
               SizedBox(
                 height: 230,
                 child: DrawerHeader(
                   padding: EdgeInsets.zero,
                         child: UserAccountsDrawerHeader(
                            accountName: Text(admin.name,textScaleFactor: 2,),accountEmail:Text(admin.role,textScaleFactor: 1.3,),
                   ),
                 ),
               ),
             // ==========profile section start here===========
             ListTile(
               leading: const Icon(
                 CupertinoIcons.profile_circled,
                 color:Colors.amber,
               ),
               title: Text("Profile",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
               onTap:(){
                 Navigator.pushNamed(context,RouteName.adminprofile);
               }
             ),
             
             // ==========Version section start here===========
             const ListTile(
               leading: Icon(
                 Icons.adb_outlined,
                 color:Colors.amber,
               ),
               title: Text("Version",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
               subtitle:Text("1.0.0",style: TextStyle(color: Colors.white,letterSpacing: 2),),
               onTap: null,
             )
           ],
         ),
        ),
      ),
    );
  }
}

