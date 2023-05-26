import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_container/component/sign_controller.dart';

class CreateUserController with ChangeNotifier{
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _loading =false;
  bool get loading=>_loading;

  setLoading(bool value){
    _loading= value;
    notifyListeners();
  }

  void createUser(String email,String password )async{
    setLoading(true);
     try{
      auth.createUserWithEmailAndPassword(email: email, password: password)
      .then((value){
        SignController.toastMessage("User Created Successfully");
        setLoading(false);
      }).onError((error, stackTrace){
        setLoading(false);
        SignController.toastMessage(error.toString());
      });
     }
     catch(e){
       setLoading(false);
       SignController.toastMessage(e.toString());
     }
  }
}