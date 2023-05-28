
import 'package:flutter/material.dart';
import 'package:flutter_container/pages/news_page.dart';
import 'package:flutter_container/utils/routes_name.dart';
import 'package:flutter_container/view_model/complaint/complain.dart';
import 'package:flutter_container/view_model/complaint/student_complaint.dart';
import 'package:flutter_container/view_model/dashboard/admin_dashboard.dart';
import 'package:flutter_container/view_model/dashboard/student_dashboard.dart';
import 'package:flutter_container/view_model/home/announcement.dart';
import 'package:flutter_container/view_model/home/home_page.dart';
import 'package:flutter_container/view_model/home/hostel_faculty_page.dart';
import 'package:flutter_container/view_model/login/admin_login.dart';
import 'package:flutter_container/view_model/login/sLoginPage.dart';
import 'package:flutter_container/view_model/profile/student_profile.dart';
import 'package:flutter_container/view_model/user_create/create_user.dart';
import 'package:path/path.dart';

import '../view_model/services/splash_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteName.splashscreen:
        return MaterialPageRoute(builder: (context)=> SplashScreen ());
      case RouteName.homepage:
        return MaterialPageRoute(builder: (context)=> HomePage());
      case RouteName.studentlogin:
        return MaterialPageRoute(builder: (context)=>SLoginPage());
      case RouteName.adminlogin:
        return MaterialPageRoute(builder: (context)=>AdminLoginPage());
      case RouteName.announcement:
        return MaterialPageRoute(builder: (context)=>Announcement());
      case RouteName.hostelfaculty:
        return MaterialPageRoute(builder: (context)=>HostelFacultyPage());
      case RouteName.studentprofile:
        return MaterialPageRoute(builder: (context)=>StudentProfile());
      case RouteName.studentdashboard:
        return MaterialPageRoute(builder: (context)=>StudentDashboardPage());
      case RouteName.admindashboard:
        return MaterialPageRoute(builder: (context)=>AdminDashboard());
      case RouteName.complaint:
        return MaterialPageRoute(builder: (context)=>Complain());
      case RouteName.mycomplaint:
        return MaterialPageRoute(builder: (context)=>MyComplaint());
      case RouteName.newspage:
        return MaterialPageRoute(builder: (context)=>NewsPage());
      case RouteName.createuser:
        return MaterialPageRoute(builder: (context)=>CreateUser());


      default:
        return MaterialPageRoute(builder: (context){
          return Scaffold(
            body: Center(child: Text("Some thing went Wrong"),),
          );
        });
    }
  }
}