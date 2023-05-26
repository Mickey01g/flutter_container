import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black45,
      child: Container(
        child: ListView(
          children: [
             DrawerHeader(
               child: Stack(
                 children: [
                   Positioned(
                           bottom: 50,
                           left: 30,
                     child: Text("CSJMU HOSTEL",style: TextStyle(color: Colors.white,),textScaleFactor: 2,),
                        ),
                     ],
                 ),
                 decoration: BoxDecoration(
                        color: Colors.red,
                        ),
             ),
            ListTile(
              leading: Icon(Icons.account_box,color:Colors.white,),
              title: Text("About",style:TextStyle(color: Colors.white),),
              onTap:null,
            ),
            ListTile(
              leading: Icon(Icons.help_center,color: Colors.white,),
              title: Text("Help",style: TextStyle(color: Colors.white),),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.adb_rounded,color: Colors.white,),
              title: Text("Version",style: TextStyle(color: Colors.white),),
              subtitle:"1.0.0".text.color(Colors.white).size(12).letterSpacing(1.5).make(),
            )
          ],
        ),
      ),
    );
  }
}

