
import 'package:flutter/material.dart';
import 'package:flutter_container/view_model/login/admin_login.dart';
import 'package:flutter_container/view_model/services/data_fetch.dart';
import 'package:velocity_x/velocity_x.dart';


class AdminProfile extends StatefulWidget {
  const AdminProfile({Key? key}) : super(key: key);

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}
class _AdminProfileState extends State<AdminProfile> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: 'Profile'.text.make(),
        ),
        body: Padding(
          padding: EdgeInsets.only(top:28),
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
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                color: Colors.grey,
                width: double.infinity,
                height: MediaQuery.of(context).size.height/1.5,
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    Center(child: Text(admin.role,style:TextStyle(),textScaleFactor:1.5,),),
                    // Divider(color: Colors.black.withOpacity(2),),
                    SizedBox(height: 30,),
                    ListTile(
                      leading: Icon(Icons.person_outline),
                      title: "Username".text.make(),
                      trailing: Text(admin.name),
                    ),
                    ListTile(
                      leading: Icon(Icons.bedroom_child_outlined),
                      title: "Contact".text.make(),
                      trailing: Text(admin.phone),
                    ),


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
