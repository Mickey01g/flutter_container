import 'package:flutter/material.dart';
class HostelFacultyPage extends StatelessWidget {
  const HostelFacultyPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Hostel Faculty"),
      ),
      body: const Material(
        child:Center(child: Text("Hello Student's")),
      ),
    );
  }
}

