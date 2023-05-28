import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_container/view_model/dashboard/admin_dashboard.dart';
import 'package:flutter_container/view_model/dashboard/student_dashboard.dart';
import 'package:flutter_container/view_model/home/home_page.dart';
import 'package:flutter_container/utils/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

    void isLogin()async{
      SharedPreferences sp= await SharedPreferences.getInstance();
      bool isLogin =sp.getBool('isLogin')??false;
      String userType=sp.getString('userType') ??'' ;
      if(isLogin){
        if(userType=='student')
          {
            Timer(const Duration(seconds: 4),(){
              Navigator.pushReplacementNamed(context,RouteName.studentdashboard);
            });
          }
        else if(userType=="admin"){
          Timer(const Duration(seconds: 4),(){
            Navigator.pushReplacementNamed(context,RouteName.admindashboard);
          });
        }
        else{
          Timer(const Duration(seconds: 4),(){
            Navigator.pushReplacementNamed(context,RouteName.homepage);
          });
        }

      }else{
        Timer(const Duration(seconds: 4),(){
          Navigator.pushReplacementNamed(context,RouteName.homepage);
        });
      }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/university-logo.png", width: 300, height: 300,),
            const Column(
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
