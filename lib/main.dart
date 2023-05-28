import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/utils/routes.dart';
import 'package:flutter_container/utils/routes_name.dart';
import 'package:flutter_container/view_model/announcement_create/create_announcement.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // QuerySnapshot snapshot = await  FirebaseFirestore.instance.collection("users").get();
  // if (kDebugMode) {
  //   print(snapshot.docs.toList());
  // }
  // DoGet().createAnnouncement();
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home:HomeScreen(),
          );
      }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splashscreen,
      onGenerateRoute:Routes.generateRoute,
    );
  }
}
