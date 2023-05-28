
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/component/sign_controller.dart';

import '../services/session_manager.dart';
import '../student_dashboard/student_dashboard.dart';
class LoginContorller with ChangeNotifier{
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  void login(BuildContext context,String email,String password)async{
    setLoading(true);
    try{
      auth.signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((value){
        SessionController().userId =value.user!.uid.toString();
        setLoading(false);
        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>StudentDashboardPage()),
                (route) =>route.isFirst);
      }).onError((error, stackTrace){
        setLoading(false);
        SignController.toastMessage(error.toString());
      });
    }catch(e){
      setLoading(false);
      SignController.toastMessage(e.toString());
    }
  }

}
