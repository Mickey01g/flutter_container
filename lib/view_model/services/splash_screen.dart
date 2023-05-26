import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_container/view_model/home/home_page.dart';
import 'package:flutter_container/utils/routes.dart';
class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>HomePage(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/university-logo.png", width: 300, height: 300,),
            Column(
              children: [
                Center(child: Text("CSJM UNIVERSITY",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w700),)),
                SizedBox(height: 10,),
                Center(child: Text("HOSTEL",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w700),)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
