
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/view_model/home/home_page.dart';
import 'package:flutter_container/view_model/dashboard/student_dashboard.dart';
import 'package:flutter_container/utils/routes.dart';
import 'package:flutter_container/view_model/services/splash_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // QuerySnapshot snapshot = await  FirebaseFirestore.instance.collection("users").get();
  // if (kDebugMode) {
  //   print(snapshot.docs.toList());
  // }

  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initialization,
        builder:(context,snapshot){
      if(snapshot.hasError){
        if (kDebugMode) {
          print("Something went wrong");
        }
      }
      if(snapshot.connectionState==ConnectionState.done){
        return
          MaterialApp(
            debugShowCheckedModeBanner: false,
            home: (FirebaseAuth.instance.currentUser != null)? StudentDashboardPage(): HomeScreen(),
          );
      }
      return const CircularProgressIndicator();
    }
    );

  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.splashscreenRoute,
      routes: {
        "/": (context) => const HomePage(),
        MyRoutes.splashscreenRoute: (context) => SplashScreen(),
      },
    );
  }
}
