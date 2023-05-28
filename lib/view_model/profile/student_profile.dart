import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/view_model/services/data_fetch.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../utils/routes_name.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}
class _StudentProfileState extends State<StudentProfile> {

  final Stream<QuerySnapshot> userData =
  FirebaseFirestore.instance.collection("users").snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: 'Profile'.text.letterSpacing(1).scale(1.4).make(),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.only(top:31),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              Center(
                child: Container(
                  height: 130,
                  width: 130,
                  decoration:BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Icon(Icons.person),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/1.6,
                child: Column(
                  children: [
                    const SizedBox(height: 10,),

                    Center(child: Text(e1.regNo,style:TextStyle(),textScaleFactor:1.5,),),
                    // Divider(color: Colors.black.withOpacity(2),),
                    const SizedBox(height: 20,),
                    Divider(
                        height: 2,
                        thickness: 1,
                        color: Colors.black,
                      ),

                    ListTile(
                      leading: Icon(Icons.person_outline),
                      title: "Username".text.scale(1.1).make(),
                      trailing: Text(e1.name,style:TextStyle(),textScaleFactor:1.2),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        height: 2,
                        color: Colors.black,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.bedroom_child_outlined),
                      title: "Room No".text.scale(1.1).make(),
                      trailing: Text(e1.room,style:TextStyle(),textScaleFactor:1.2),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        height: 2,
                        color: Colors.black,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: "Contact".text.scale(1.1).make(),
                      trailing: Text(e1.phone,style:TextStyle(),textScaleFactor:1.2),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        height: 2,
                        color: Colors.black,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.mail_outline_outlined),
                      title: "Email".text.scale(1.1).make(),
                      trailing: Text(e1.email,style:TextStyle(),textScaleFactor:1.2),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        height: 2,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                          ),
                          child: Center(child: Text("Back")),
                        ),
                      ),
                    )
                  ],
                ),
              )
                  // ReuseRow(title:"Username",value: e1.name,iconData: Icons.person_outline,),
            ],
          ),
        ),
      ),
    );
  }
}

class ReuseRow extends StatelessWidget {
  final title,value;
  final IconData iconData;
  const ReuseRow({Key? key, this.title, this.value, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          leading: Icon(iconData),
          trailing: Text(value),
        ),
        Divider(color: Colors.black.withOpacity(2),)
      ],
    );
  }
}
