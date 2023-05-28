
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/utils/routes_name.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gsheets/gsheets.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../component/inputfield.dart';
import '../../component/sign_controller.dart';



class AdminData {
  late String name;
  late String phone;
  late String role;
  AdminData(
      {required this.name,
        required this.phone,
        required this.role,
      });
}
final admin = AdminData(name: '', phone: '', role: '');



class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  final formKey = GlobalKey<FormState>();

  void login() async{
    String userId =emailController.text.trim();
    String password =passwordController.text.trim();
    const credentials = r'''
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
    const spreadsheetId = "1XEiR6x2_ipo6BKt5q8AIsiedxuXHhVVfc0uBvBP2940";
    final gSheets = GSheets(credentials);
    final ss = await gSheets.spreadsheet(spreadsheetId);
    var sheet = ss.worksheetByTitle("Admins");
    List<Cell>? cellsRow;
    for (var i = 1; i <= 10; i++) {
      cellsRow = await sheet?.cells.row(i);
      if(cellsRow?.elementAt(2)!=null) {
      }
      if (userId==cellsRow?.elementAt(2).value.toString() && password ==cellsRow?.elementAt(3).value.toString()){
        var name=cellsRow?.elementAt(1).value.toString();
        var role=cellsRow?.elementAt(4).value.toString();
        var mobile=cellsRow?.elementAt(5).value.toString();
        admin.name=name.toString();
        admin.role=role.toString();
        admin.phone=mobile.toString();
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context,RouteName.admindashboard);
        break;
      }
      else{
        Fluttertoast.showToast(msg: "User not found !");
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
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height*1,
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
                                      child: Text("Admin Login", style: TextStyle(fontSize: 30),),
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
                                                InkWell(
                                                    onTap: (){
                                                      login();
                                                    },
                                                    child:Container(
                                                      width: 360,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius: BorderRadius.circular(30)
                                                      ),
                                                      child:Center(child: Text("Login",textScaleFactor: 1.6,)),
                                                    )
                                                ),
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