import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignController{
 static void fieldFocus(BuildContext context,FocusNode currentNode,FocusNode nextNode){
   currentNode.unfocus();
   FocusScope.of(context).requestFocus(nextNode);
 }

 static toastMessage(String message){
   Fluttertoast.showToast(
       msg: message,
       backgroundColor: Colors.amber,
       textColor: Colors.white,
     fontSize: 16
   );
 }
}