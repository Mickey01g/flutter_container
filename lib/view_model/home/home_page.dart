
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/view_model/admin_login/admin_login.dart';
import 'package:flutter_container/view_model/home/hostel_faculty_page.dart';
import 'package:flutter_container/pages/news_page.dart';
import 'package:flutter_container/view_model/student_login/sLoginPage.dart';
import 'package:flutter_container/view_model/drawer/drawer.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:velocity_x/velocity_x.dart';





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
        child: Text('No'),
      ),
      TextButton(
        onPressed: () => Navigator.of(context).pop(true),
        child: Text('Yes'),
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
          backgroundColor: Colors.red,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Hostel App'),
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: SizedBox(
              width: 400,
              // color: Colors.amber,
              child: Column(
                children: [
                  //================Image container start from here====================
                  SizedBox(
                    width: 400,
                    height: 250,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          //==========first image container=============
                          Image.asset(
                            'assets/images/Boys-Hostel-2.jpg', fit: BoxFit.fill,),
                          //=============second image container============
                          Image.asset(
                              'assets/images/Kaveri-Girls-Hostel.jpg'),
                          //=========third image container=============
                          Image.asset(
                              'assets/images/Triveni-Girls-Hostel.jpg'),
                          Image.asset(
                              'assets/images/Swarn-Jayant-Hostel.png')
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
                        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>SLoginPage()), (route) => route.isFirst);
                      },
                        style: TextButton.styleFrom(
                            minimumSize: const Size(140, 80)),
                        child: const Text("Student Login"),
                      ),
                      const SizedBox(width: 10,),
                      // ======= admin login here =============
                      ElevatedButton(onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AdminLoginPage()));
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewsPage()));
                      }, style: TextButton.styleFrom(
                            minimumSize: const Size(290, 60)),
                        child: const Text("Announcements"),
                      ),
                      const SizedBox(height: 10,),
                      //======faculty button start form here============
                      ElevatedButton(onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const HostelFacultyPage()));
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
                          ElevatedButton(onPressed:formDownload, style: TextButton
                                .styleFrom(minimumSize: const Size(140, 80)),
                            child: const Text("Hostel Form"),),
                          const SizedBox(width: 10,),
                          // ========= rules button here ===============
                          ElevatedButton(onPressed:hostelRule,
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
    var status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      FileDownloader.downloadFile(
        url: formUrl,
        name: "HOSTEL_FORM.pdf",
        onProgress: (String? filename, double process) {
          // print("FILE $filename HAS PROGRESS $process");
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("$filename HAS PROGRESS $process"),
                action:SnackBarAction(
                  label:"Ok", onPressed: () { null; },
                ),),
              );
        },
        onDownloadCompleted: (String path) {
          if (kDebugMode) {
            print("File downloaded $path");
          }
        },
        onDownloadError: (String error) {
          if (kDebugMode) {
            print("DOWNLOAD ERROR $error");
          }
        },
      );
    }
    else {
      if (kDebugMode) {
        print("PERMISSION is NOT GRANTED");
      }
    }
  }
}


//hostel rule
void hostelRule() async {
  var status = await Permission.storage.request();
  if (status == PermissionStatus.granted) {
    const hostelRuleUrl="https://csjmu.ac.in/wp-content/uploads/docs/2022/09/Hostel-council-PDF-file.pdf";
    FileDownloader.downloadFile(
      url: hostelRuleUrl,
      name: "HOSTEL_FORM.pdf",
      onProgress: (String? filename, double process) {
        try{
          if (kDebugMode) {
            print("FILE $filename HAS PROGRESS $process");
          }
        }
        catch(e){
          if (kDebugMode) {
            print(e.toString());
          }
        }
      },
      onDownloadCompleted: (String path) {
       try{
         if (kDebugMode) {
           AlertDialog(
             title:"Download Path".text.make(),
             actions: [
               "Close".text.make()
             ],
           );
           // print("File downloaded $path");
         }
       }catch(e){
         if (kDebugMode) {
           print(e.toString());
         }
       }
      },
      onDownloadError: (String error) {
       try{
         if (kDebugMode) {
           print("DOWNLOAD ERROR $error");
         }
       }
       catch(e){
         if (kDebugMode) {
           print(e.toString());
         }
       }
      },
    );
  }
  else {
    try{
      if (kDebugMode) {
        print("PERMISSION is NOT GRANTED");
      }
    }
    catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}