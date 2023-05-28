//
// import 'dart:async';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_container/component/sign_controller.dart';
// import 'package:flutter_container/utils/routes_name.dart';
// import 'package:flutter_container/view_model/services/session_manager.dart';
//
// class SplashServices{
//
//   void isLogin(BuildContext context){
//     FirebaseAuth auth = FirebaseAuth.instance;
//     final user = auth.currentUser;
//
//     if(user != null){
//       SessionController().userId=user.uid.toString();
//       Timer(Duration(seconds: 3),()=>Navigator.pushNamed(context,RouteName.studentdashboard));
//     }else{
//       Timer(Duration(seconds: 3),()=>Navigator.pushNamed(context,RouteName.studentlogin));
//     }
//
//   }
// }