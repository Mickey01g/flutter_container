import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class HostelFacultyPage extends StatelessWidget {
  const HostelFacultyPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:Center(child: "Hostel Faculty".text.letterSpacing(2).scale(1.4).make()),
      ),
      body:SafeArea(
        child:Container(
          child: Image.asset("assets/images/hostel-faculty.jpg",fit: BoxFit.fill,),
        )
      ),
    );
  }
}

