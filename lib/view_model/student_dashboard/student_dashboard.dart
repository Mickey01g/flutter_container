import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_container/utils/routes_name.dart';
import 'package:flutter_container/view_model/drawer/student_drawer.dart';
import 'package:flutter_container/view_model/services/session_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'complaint/student_complaint.dart';


class StudentDashboardPage extends StatefulWidget {
  const StudentDashboardPage({super.key});

  @override
  State<StudentDashboardPage> createState() => _StudentDashboardPageState();
}

class _StudentDashboardPageState extends State<StudentDashboardPage> {
  Future<bool> onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  Future<bool?> showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => buildExitDialog(context),
    );
  }

  AlertDialog buildExitDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Please confirm'),
      content: const Text('Do you want to exit the app?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () async{
            SystemNavigator.pop();
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
//   final controller = PersistentTabController(initialIndex: 0);
//   List<Widget> _buildScreen() {
//   return[
//     Text('Home'),
//     Text('Support'),
//     Text('Add'),
//     Text('Version'),
//     // StudentProfileScreen(),
//     StudentProfile(),
//
//   ];
// }
// List<PersistentBottomNavBarItem> _navBarItem(){
//     return[
//       PersistentBottomNavBarItem(
//           icon:Icon(Icons.home,color: Colors.white,),
//         inactiveIcon: Icon(Icons.home,color: Colors.grey,)
//
//       ),
//       PersistentBottomNavBarItem(
//           icon:Icon(Icons.help_outline_sharp,color: Colors.white,),
//           inactiveIcon: Icon(Icons.help_outline_sharp,color: Colors.grey,)
//
//       ),
//       PersistentBottomNavBarItem(
//           icon:Icon(Icons.home,color: Colors.white,),
//           inactiveIcon: Icon(Icons.home,color: Colors.grey,)
//
//       ),
//       PersistentBottomNavBarItem(
//           icon:Icon(Icons.home,color: Colors.white,),
//           inactiveIcon: Icon(Icons.home,color: Colors.grey,)
//
//       ),
//       PersistentBottomNavBarItem(
//           icon:Icon(Icons.person,color: Colors.white,),
//           inactiveIcon: Icon(Icons.person,color: Colors.grey,)
//
//       ),
//     ];
// }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child:
      Scaffold(
          appBar: AppBar(
            title: const Text("Student Dashboard"),
            actions:[
              IconButton(onPressed:() async {
                FirebaseAuth.instance.signOut().then((value) async {
                  SharedPreferences sp= await SharedPreferences.getInstance();
                  sp.clear();
                  SessionController().userId = '' ;
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                }).onError((error, stackTrace){
                 Fluttertoast.showToast(msg: error.toString());
                });

              }, icon:const Icon(Icons.login_outlined)),
            ],
          ),
          drawer: const StudentDrawer(),
          body:SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              child: Material(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:10,horizontal:25),
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.pushNamed(context, RouteName.complaint);
                                    },
                                    child: Card(
                                      color: Colors.blue.shade300,
                                      child: const SizedBox(
                                        width: 140,height: 140,
                                        child: Center(child: Text("Complain",style:TextStyle(fontSize: 16,color: Colors.white))),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.pushNamed(context,RouteName.mycomplaint);
                                    },
                                    child:Card(
                                      color: Colors.blue.shade300,
                                      child: const SizedBox(
                                        width: 140,height: 140,
                                        child: Center(child: Text("My Room",style:TextStyle(fontSize: 16,color: Colors.white))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context,RouteName.announcementview);
                                  },
                                  child:Card(
                                    color: Colors.blue.shade300,
                                    child: const SizedBox(
                                      width: 140,height: 140,
                                      child: Center(child: Text("Announcement",style:TextStyle(fontSize: 16,color: Colors.white))),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20,),
                                InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context,RouteName.trackcomplain);
                                  },
                                  child:Card(
                                    color: Colors.blue.shade300,
                                    child: const SizedBox(
                                      width: 140,height: 140,
                                      child: Center(child: Text("Track Complain",style:TextStyle(fontSize: 16,color: Colors.white))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    CupertinoButton(onPressed: (){
                      Navigator.pushNamed(context,RouteName.complaint);
                    }, color: Colors.blue,child: const Text("Create Complaint",
                      style:TextStyle(color: Colors.white),
                      textScaleFactor: 1,textAlign: TextAlign.center,))
                  ],
                ),

              ),
            ),
          )
      ),
      // child: PersistentTabView(
      //   context,
      //   screens: _buildScreen(),
      //   items: _navBarItem(),
      //   backgroundColor: Colors.blue,
      //   decoration: NavBarDecoration(
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      //   navBarStyle: NavBarStyle.style15,
      // ),
    );
  }
}

