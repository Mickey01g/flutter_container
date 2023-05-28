
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
          title: 'Profile'.text.letterSpacing(1).scale(1.4).make(),
          automaticallyImplyLeading:false,
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
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Icon(Icons.person),
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/1.6,
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    Center(child: Text(admin.role,style:const TextStyle(),textScaleFactor:1.6),),
                    // Divider(color: Colors.black.withOpacity(2),),
                    const SizedBox(height: 20,),
                       const Divider(
                        height: 2,
                        thickness: 1,
                        color: Colors.black,
                      ),
                    ListTile(
                      leading: const Icon(Icons.person_outline),
                      title: "Username".text.scale(1.1).make(),
                      trailing: Text(admin.name,style:const TextStyle(),textScaleFactor:1.1),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        height: 2,
                        color: Colors.black,
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.bedroom_child_outlined),
                      title: "Contact".text.scale(1.1).make(),
                      trailing: Text(admin.phone,style:TextStyle(),textScaleFactor:1.1),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                        child: Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                          ),
                          child: const Center(child: Text("Back")),
                        ),
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
