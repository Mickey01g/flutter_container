
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/component/inputfield.dart';
import 'package:flutter_container/component/roundbutton.dart';
import 'package:flutter_container/view_model/dashboard/student_dashboard.dart';
import 'package:flutter_container/view_model/student_login/login_controller.dart';
import 'package:gsheets/gsheets.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../component/sign_controller.dart';

String _name="";
String _email="";
int _phone=0;


class SLoginPage extends StatefulWidget {
  const SLoginPage({super.key});
  @override
  State<SLoginPage> createState() => _SLoginPageState();
}

class _SLoginPageState extends State<SLoginPage> {



  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  final formKey = GlobalKey<FormState>();


  void login() async{
    String email =emailController.text.trim();
    String password =passwordController.text.trim();
    if(email == "" || password==""){
      SignController.toastMessage("Please fill all fields !");
    }
    else{
      try{
        UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        if(userCredential.user != null){
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(context ,MaterialPageRoute(builder: (context)=>StudentDashboardPage()), (route) => route.isFirst);
          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>StudentDashboardPage()));
        }
      }on FirebaseAuthException catch(e){
        SignController.toastMessage(e.code.toString());
      }
    }
  }
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final emailFocusNode=FocusNode();
  final passwordFocusNode=FocusNode();

  @override
  void dispose(){
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Material(
          child: SingleChildScrollView(
            child: Form(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 3.7,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text("Hostel Complain System",
                                      style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                                      textScaleFactor: 1.3,
                                    ),
                                  ),
                                  Image.asset("assets/images/university-logo.png", width: 300, height: 200,),
                                ],
                              ),
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20 * 2.5),
                                topRight: Radius.circular(20 * 2.5),
                              )),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const Column(
                                  children: [
                                    Padding(padding: EdgeInsets.only(top: 20),
                                      child: Text("Student Login", style: TextStyle(fontSize: 30),),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 50,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 300,
                                  child: Column(
                                    children: [
                                      //=========Login Id input here============
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width / 1.1,
                                        child: SingleChildScrollView(
                                          child: Form(
                                            key: formKey,
                                            child: Column(
                                              children: [
                                                InputTextField(myController: emailController,
                                                    focusNode: emailFocusNode,
                                                    onFieldSubmitValue:(value){
                                                      SignController.fieldFocus(context, emailFocusNode, passwordFocusNode);
                                                    },
                                                    keyBoradType: TextInputType.emailAddress,
                                                    obscureText: false,
                                                    hint: "Email",
                                                    onValidator:(value){
                                                    return value.isEmpty ? 'Enter email' :null;
                                                    }),
                                                const SizedBox(height: 10,),
                                                //=======Login Password input here=========
                                                InputTextField(myController: passwordController,
                                                    focusNode: passwordFocusNode,
                                                    onFieldSubmitValue:(value){},
                                                    keyBoradType: TextInputType.text,
                                                    obscureText: true,
                                                    hint: "Password",
                                                    onValidator:(value){
                                                      return value.isEmpty ? 'Enter password' :null;
                                                    }),
                                                const SizedBox(height: 50,),
                                               ChangeNotifierProvider(
                                                 create:(_) => LoginContorller(),
                                                 child: Consumer<LoginContorller>(
                                                   builder: (context,provider,child){
                                                     return  RoundButton(
                                                       title: 'Login',
                                                       loading: provider.loading,
                                                       onPress: () {
                                                         if(formKey.currentState!.validate()) {
                                                           provider.login(context, emailController.text, passwordController.text);
                                                           Fetch3();
                                                         }
                                                       },
                                                     );
                                                   },
                                                 ),
                                               )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// fetch individiual user

Fetch2(String emailuser) async{
  const _credentials = r'''
  {
   "type": "service_account",
  "project_id": "csjmuhostel-e45f1",
  "private_key_id": "33a73d33c54653a37f26cb41886d5968a595665d",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDwdMZNA5CMf5in\ngbsEijKTItFGqoN1DuHjrO3VBiUxGyqHE0GSXxd8ZNh7KuFn82u7/T8YGW9vA7lz\nIJFjCg4FzDiE+AWO/l7bvRA0ymxc5V157HDjMAe5SQ4YklijccTOzA2GXYipybU0\nX5CiyYVAqXD3gfOaxP0hiO5ohENavYJpbmL3XMFQXkB0gP7yoFvN51lW7fmd4jMi\nB5tAJvWQj1aw0AqHh7LkQjG6vNqjcyzDRNh3mYaZv8G261aqXDhuJKvMOtTH+uae\nV6edPRPPoiAl039W8qiUYEeElH4B9vVQUqDlmfwuatexwrfyu6mYFA1YeX2J0NkV\nP4/11+UHAgMBAAECggEACAEDFs4vEhYvOSgu1vxYqaAnkjAb1xorN75qXkRpmYRb\neoqQDLTAneHneNYZEbI/HE9WOdGi7XGUyznCzSapB9Vf7kEpQjTCaJMXBoLUb5Us\n8uGFcnKHV0oQv42jiLFBSVbuflH/uhMeRoOF131Yw6nAOmTnfHfhKywZL35zlYIX\n4AOAUU0a0qL+aULKBR5JlBMwNvhQAQeca/HvbNGloXUa7cCXYQ+3RUJFTJmqjTvs\nKNA7WhzeRybrbxNZ61DR6IEzcFJqKUjW9RsHrATegNYjReVI2jdl9ItdieTGXpQO\nJn5VlHq2xtixhebPaq+ujJfLL8lT2GzPZp2sKt19cQKBgQD6r7v4DjrkZu7o5kVn\nV28LTQkjsBIE1MW2MgpYsp0Y37cXcgHmAdV9a97CGyB7sKqoYhfQqUhm/XhBJgfG\nOgpv/LwQLghIYQjfx4u5vjZBGANvhN2UizDReBP7UymmgFd/60b6ZEy8K5yQ5Gle\nkyHUloU/S6lcl8gOgCnNsSXV8QKBgQD1jYdtsQxBgvNqESwgrrIGWqOeIkAAIOA7\n+jcwClUPbr+s7RF8hGTlB40Wr94vyQJxKkTGSLADnrhxIovJZI5tSEO1Mpqy7ani\n760mmrlPfs5DQRQbFeSsV9DV0JECLjIPpWn91e+EAinxTRrDk3VO9apKbp94saY8\nxeToZx6SdwKBgDuIuI80cfAEMgDFjv332btJVD5RdjYHgdy/DY36/SwHFShQPvss\nvFLI52IZpyE4146dnSJE0ZkD4Sc3rOj6p7fowZDmHblysfTTIu+9qIzU8xvs5eJ9\nG97jMXuiSGXuXNlYOscEQuT9RnVyiUOYlZQzGvnpMhN3SF+JOGRNCbtBAoGBAL9N\nnf71emjnjqBJ9KkZsRSGNQaUBGyVMF1J2QkSY6Z8T9R3dbIeq0RLl73fEikEX2Su\n25nnM0n+tA9gLKugLd4x+J4IaMGRq1NkCvAShuDKGAQJhZJ8ggVK/SY3MWITf2j1\nJBhgPhQIY4jc20cXcMMtXZhTiuZK8QpT2ry86fKNAoGABiE6zgantnan2QpbyL1A\nNHQyN1Z27Oy9j+5LCrR1knBYTsn/goDoro56k9Yl2hF/TwAvIBkID2QSTBRPRfvW\ndln9wamIe5TysHy0kRfDbHSsOShoAn/YAABBLZhjurrloif4f2NqN54vpUl956l2\n9AN3i12Wlvp4ByziksCejO4=\n-----END PRIVATE KEY-----\n",
  "client_email": "hosteldatabase@csjmuhostel-e45f1.iam.gserviceaccount.com",
  "client_id": "116715855237137569487",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/hosteldatabase%40csjmuhostel-e45f1.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"

  }
  ''';
  SignController.toastMessage(emailuser);
  print(emailuser);
  print("\n\n\n\n\n");

  const spreadsheetid = "1XEiR6x2_ipo6BKt5q8AIsiedxuXHhVVfc0uBvBP2940";
  final gsheets = GSheets(_credentials);
  final ss = await gsheets.spreadsheet(spreadsheetid);
  var sheet = ss.worksheetByTitle("description");
  int rows =sheet!.rowCount.length;
  var username;
  int mobileno;
  var cellsRow;
  for(var i=1; i<rows.length; i++){
    cellsRow=await sheet.cells.row(i);
      username=cellsRow.elementAt(0).value;
      mobileno=cellsRow.elementAt(1).value;
      print(cellsRow.elementAt(2).value);
      print("USER FOUND");
      print(username);
      print(mobileno);
      print("\n\n\n\n\n");
    // if (emailuser==cellsRow.elementAt(2)){
    //   username=cellsRow.elementAt(0);
    //   mobileno=cellsRow.elementAt(1);
    //   print(cellsRow.elementAt(2));
    //   print("USER FOUND");
    //   print("\n\n\n\n\n");
    // }
    // else{
    //   SignController.toastMessage("User Not Found");
    //   if (kDebugMode) {
    //     print("USER NOT FOUND");
    //     print("\n\n\n\n\n");
    //
    //   }
    // }

  }

}

Fetch3() async{
  const _credentials = r'''
  {
   "type": "service_account",
  "project_id": "csjmuhostel-e45f1",
  "private_key_id": "33a73d33c54653a37f26cb41886d5968a595665d",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDwdMZNA5CMf5in\ngbsEijKTItFGqoN1DuHjrO3VBiUxGyqHE0GSXxd8ZNh7KuFn82u7/T8YGW9vA7lz\nIJFjCg4FzDiE+AWO/l7bvRA0ymxc5V157HDjMAe5SQ4YklijccTOzA2GXYipybU0\nX5CiyYVAqXD3gfOaxP0hiO5ohENavYJpbmL3XMFQXkB0gP7yoFvN51lW7fmd4jMi\nB5tAJvWQj1aw0AqHh7LkQjG6vNqjcyzDRNh3mYaZv8G261aqXDhuJKvMOtTH+uae\nV6edPRPPoiAl039W8qiUYEeElH4B9vVQUqDlmfwuatexwrfyu6mYFA1YeX2J0NkV\nP4/11+UHAgMBAAECggEACAEDFs4vEhYvOSgu1vxYqaAnkjAb1xorN75qXkRpmYRb\neoqQDLTAneHneNYZEbI/HE9WOdGi7XGUyznCzSapB9Vf7kEpQjTCaJMXBoLUb5Us\n8uGFcnKHV0oQv42jiLFBSVbuflH/uhMeRoOF131Yw6nAOmTnfHfhKywZL35zlYIX\n4AOAUU0a0qL+aULKBR5JlBMwNvhQAQeca/HvbNGloXUa7cCXYQ+3RUJFTJmqjTvs\nKNA7WhzeRybrbxNZ61DR6IEzcFJqKUjW9RsHrATegNYjReVI2jdl9ItdieTGXpQO\nJn5VlHq2xtixhebPaq+ujJfLL8lT2GzPZp2sKt19cQKBgQD6r7v4DjrkZu7o5kVn\nV28LTQkjsBIE1MW2MgpYsp0Y37cXcgHmAdV9a97CGyB7sKqoYhfQqUhm/XhBJgfG\nOgpv/LwQLghIYQjfx4u5vjZBGANvhN2UizDReBP7UymmgFd/60b6ZEy8K5yQ5Gle\nkyHUloU/S6lcl8gOgCnNsSXV8QKBgQD1jYdtsQxBgvNqESwgrrIGWqOeIkAAIOA7\n+jcwClUPbr+s7RF8hGTlB40Wr94vyQJxKkTGSLADnrhxIovJZI5tSEO1Mpqy7ani\n760mmrlPfs5DQRQbFeSsV9DV0JECLjIPpWn91e+EAinxTRrDk3VO9apKbp94saY8\nxeToZx6SdwKBgDuIuI80cfAEMgDFjv332btJVD5RdjYHgdy/DY36/SwHFShQPvss\nvFLI52IZpyE4146dnSJE0ZkD4Sc3rOj6p7fowZDmHblysfTTIu+9qIzU8xvs5eJ9\nG97jMXuiSGXuXNlYOscEQuT9RnVyiUOYlZQzGvnpMhN3SF+JOGRNCbtBAoGBAL9N\nnf71emjnjqBJ9KkZsRSGNQaUBGyVMF1J2QkSY6Z8T9R3dbIeq0RLl73fEikEX2Su\n25nnM0n+tA9gLKugLd4x+J4IaMGRq1NkCvAShuDKGAQJhZJ8ggVK/SY3MWITf2j1\nJBhgPhQIY4jc20cXcMMtXZhTiuZK8QpT2ry86fKNAoGABiE6zgantnan2QpbyL1A\nNHQyN1Z27Oy9j+5LCrR1knBYTsn/goDoro56k9Yl2hF/TwAvIBkID2QSTBRPRfvW\ndln9wamIe5TysHy0kRfDbHSsOShoAn/YAABBLZhjurrloif4f2NqN54vpUl956l2\n9AN3i12Wlvp4ByziksCejO4=\n-----END PRIVATE KEY-----\n",
  "client_email": "hosteldatabase@csjmuhostel-e45f1.iam.gserviceaccount.com",
  "client_id": "116715855237137569487",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/hosteldatabase%40csjmuhostel-e45f1.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"

  }
  ''';
  const spreadsheetid = "1XEiR6x2_ipo6BKt5q8AIsiedxuXHhVVfc0uBvBP2940";
  final CollectionReference contacts=FirebaseFirestore.instance.collection("users");
  final gsheets = GSheets(_credentials);
  final ss = await gsheets.spreadsheet(spreadsheetid);
  var sheet = ss.worksheetByTitle("description");
  if (kDebugMode) {
    print(spreadsheetid);
    print(_credentials);
  }
  try{
    int rows =sheet!.rowCount.length;
    List<Cell> cellsRow;
    for(var i=1; i<3; i++){
      cellsRow=await sheet.cells.row(i);
      var username=cellsRow.elementAt(0).value;
      var email =cellsRow.elementAt(2).value;
      print(email);
      print(username);
      SignController.toastMessage("muthhi");
      _email=email;
      _name=username;
      if (kDebugMode) {
        print("$_email $_name");
      }
    }

  }catch(e){
    print(e.toString());
    SignController.toastMessage(e.toString());
  }

}