import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/component/inputfield.dart';
import 'package:flutter_container/component/roundbutton.dart';
import 'package:flutter_container/utils/routes_name.dart';
import 'package:flutter_container/view_model/login/login_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../component/sign_controller.dart';
import '../services/data_fetch.dart';


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
  final auth=FirebaseAuth.instance;

  void login() async{
    String email =emailController.text.trim();
    String password =passwordController.text.trim();
    if(email == "" || password==""){
      SignController.toastMessage("Please fill all fields !");
    }
    else{
      try{
        UserCredential userCredential=await FirebaseAuth.instance.
        signInWithEmailAndPassword(email: email, password: password);
        if(userCredential.user != null){
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context,RouteName.studentdashboard);
        }
      }on FirebaseAuthException catch(e){
        debugPrint(e.toString());
        Fluttertoast.showToast(msg: e.toString());
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
    emailController.clear();
    passwordController.clear();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Material(
          child: Form(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*1-40,
                color: Colors.red,
                child: Expanded(
                  flex: 2,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width:double.infinity,
                            height: MediaQuery.of(context).size.height/3,
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 60),
                                  child: Text("Hostel Complain System",
                                    style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                                    textScaleFactor: 1.3,
                                  ),
                                ),
                                Image.asset("assets/images/university-logo.png", width: 300, height: 200,),
                              ],
                            )),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20 * 2.5),
                                  topRight: Radius.circular(20 * 2.5),
                                )),
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
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Form(
                                            key: formKey,
                                            child: Column(
                                              children: [
                                                InputTextField(
                                                    myController: emailController,
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
                                                       onPress: () async {
                                                         if(formKey.currentState!.validate()) {
                                                           provider.login(context, emailController.text, passwordController.text);
                                                           fetch3();
                                                           SharedPreferences sp= await SharedPreferences.getInstance();
                                                           sp.setString('email', emailController.text.toString());
                                                           sp.setString('password',passwordController.text.toString());
                                                           sp.setBool('isLogin',true);
                                                           sp.setString('userType','student');
                                                           // ignore: use_build_context_synchronously

                                                           // auth.createUserWithEmailAndPassword(email:emailController.text.trim(), password:passwordController.text.trim());

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






