
import 'package:flutter/foundation.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_container/utils/routes_name.dart';
import 'package:flutter_container/view_model/drawer/drawer.dart';

import '../../component/sign_controller.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<bool> onWillPop(BuildContext context) async {
  bool? exitResult = await showDialog(
    context: context,
    builder: (context) => buildExitDialog(context),
  );
  return exitResult ?? false;
}

Future<bool?> showExitDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => buildExitDialog(context),
  );
}

AlertDialog buildExitDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Please confirm'),
    content: const Text('Do you want to exit the app?'),
    actions: <Widget>[
      TextButton(
        onPressed: () => Navigator.of(context).pop(false),
        child: const Text('No'),
      ),
      TextButton(
        onPressed:() async{
      SystemNavigator.pop();
      },
        child: const Text('Yes'),
      ),
    ],
  );
}
class _HomePageState extends State<HomePage> {
  final formUrl = "https://csjmu.ac.in/wp-content/uploads/docs/2021/09/Hostel-application-FORM.pdf";
  final hostelRuleUrl ="https://csjmu.ac.in/wp-content/uploads/docs/2022/09/Hostel-council-PDF-file.pdf";


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title:  const Center(child: Text('Hostel App')),
        ),
        drawer: MyDrawer(),
        body: SafeArea(
          child: Center(
            child: Container(
              decoration:BoxDecoration(
                color: Colors.black.withOpacity(0.2),
              ),
              width:double.infinity,
              height:MediaQuery.sizeOf(context).height*1,
              // color: Colors.amber,
              child: Column(
                children: [
                  //================Image container start from here====================
                  SizedBox(
                    width:double.infinity,
                    height: 250,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          //==========first image container=============
                          Image.asset('assets/images/Boys-Hostel-2.jpg', fit: BoxFit.fill,),
                          //=============second image container============
                          Image.asset('assets/images/Kaveri-Girls-Hostel.jpg',fit: BoxFit.fill),
                          //=========third image container=============
                          Image.asset('assets/images/Triveni-Girls-Hostel.jpg',fit: BoxFit.fill),
                          Image.asset('assets/images/Swarn-Jayant-Hostel.png',fit: BoxFit.fill)
                        ],
                      ),
                    ),
                  ),
                  //================Image container end from here====================
                  const SizedBox(height: 50.0,),
                  // ==================button container start from here===========================
                  //======== first part of button start form here==========
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ======= student login here ==========
                      ElevatedButton(onPressed: () {
                        Navigator.pushNamed(context, RouteName.studentlogin,);
                      },
                        style: TextButton.styleFrom(
                            minimumSize: const Size(140, 80)),
                        child: const Text("Student Login"),
                      ),
                      const SizedBox(width: 10,),
                      // ======= admin login here =============
                      ElevatedButton(onPressed: () {
                        Navigator.pushNamed(context,RouteName.adminlogin);
                      }, style: TextButton.styleFrom(
                          minimumSize: const Size(140, 80)), child: const Text("Admin Login"),
                      ),
                    ],
                  ),
                  // ========== first part of button end here ===============
                  const SizedBox(height: 10,),
                  //=============Information container start form here==========
                  //========= second part of button start from here===========
                  //======announcement button here========
                  Column(
                    children: [
                      ElevatedButton(onPressed: () {
                        Navigator.pushReplacementNamed(context,RouteName.newspage);
                      }, style: TextButton.styleFrom(
                            minimumSize: const Size(290, 60)),
                        child: const Text("Announcements"),
                      ),
                      const SizedBox(height: 10,),
                      //======faculty button start form here============
                      ElevatedButton(onPressed: () {
                        Navigator.pushNamed(context,RouteName.hostelfaculty);
                      },style: TextButton.styleFrom(minimumSize: const Size(290, 60)),
                        child: const Text("Hostel Faculty"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //======faculty button end form here============
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //======= hostel form here===========
                          ElevatedButton(onPressed:(){
                            formDownload();
                          }, style: TextButton
                                .styleFrom(minimumSize: const Size(140, 80)),
                            child: const Text("Hostel Form"),
                          ),
                          const SizedBox(width: 10,),
                          // ========= rules button here ===============
                          ElevatedButton(onPressed:(){
                                 ruleDownload();
                          },
                            style: TextButton.styleFrom(
                                minimumSize: const Size(140, 80)),
                            child: const Text("Hostel Rule"),),
                        ],
                      )
                    ],
                  ),
                  //========second part of button end here =====================
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }

// DOWNLOAD HOSTEL_FORM PDF
  void formDownload() async {
      FileDownloader.downloadFile(
        url: formUrl,
        name: "HOSTEL_FORM.pdf",
        onProgress: (String? filename, double process) {
          SignController.toastMessage("$filename HAS PROGRESS $process");
        },
        onDownloadCompleted: (String path) {

          SignController.toastMessage("File downloaded $path");
        },
        onDownloadError: (String error) {
          if (kDebugMode) {
            print("DOWNLOAD ERROR $error");
          }
        },
      );

  }
//  Hostel Rule download
  void ruleDownload() async {
    FileDownloader.downloadFile(
      url: hostelRuleUrl,
      name: "HOSTEL_Rule.pdf",
      onProgress: (String? filename, double process) {
        SignController.toastMessage("$filename HAS PROGRESS $process");
      },
      onDownloadCompleted: (String path) {

        SignController.toastMessage("File downloaded $path");
      },
      onDownloadError: (String error) {
        if (kDebugMode) {
          print("DOWNLOAD ERROR $error");
        }
      },
    );

  }
}



