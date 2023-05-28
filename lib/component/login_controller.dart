
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_container/utils/routes_name.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import '../view_model/services/session_manager.dart';

class LoginController with ChangeNotifier{
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _loading=false;
  bool get loading=>_loading;

  setLoading(bool value){
     _loading=value;
     notifyListeners();
  }
  void login(BuildContext context,String email,String password)async{
       setLoading(true);
      try{
          auth.signInWithEmailAndPassword(email: email, password: password
          ).then((value){
            SessionController().userId=value.user?.uid.toString();
            setLoading(false);
            Navigator.pushReplacementNamed(context,RouteName.studentdashboard);
          }).onError((error, stackTrace){
            Fluttertoast.showToast(msg:error.toString());
          });
      }catch(e){
        setLoading(false);
        Fluttertoast.showToast(msg: e.toString());
      }
  }
}

