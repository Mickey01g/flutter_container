import 'package:flutter/material.dart';
import 'package:flutter_container/view_model/admin_dashboard/global_complain.dart';
import 'package:flutter_container/view_model/home/about_page.dart';
import 'package:flutter_container/view_model/home/news_page.dart';
import 'package:flutter_container/utils/routes_name.dart';
import 'package:flutter_container/view_model/admin_dashboard/admin_dashboard.dart';
import 'package:flutter_container/view_model/admin_dashboard/create_announcement.dart';
import 'package:flutter_container/view_model/home/home_page.dart';
import 'package:flutter_container/view_model/home/hostel_faculty_page.dart';
import 'package:flutter_container/view_model/login/admin_login.dart';
import 'package:flutter_container/view_model/login/sLoginPage.dart';
import 'package:flutter_container/view_model/profile/admin_profile.dart';
import 'package:flutter_container/view_model/profile/student_profile.dart';
import 'package:flutter_container/view_model/student_dashboard/complaint/complain_view.dart';
import 'package:flutter_container/view_model/student_dashboard/complaint/track_complain.dart';
import '../view_model/services/splash_screen.dart';
import '../view_model/student_dashboard/announcement_view.dart';
import '../view_model/student_dashboard/complaint/create_complain.dart';
import '../view_model/student_dashboard/complaint/student_complaint.dart';
import '../view_model/student_dashboard/student_dashboard.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteName.splashscreen:
        return MaterialPageRoute(builder: (context)=> const SplashScreen ());
      case RouteName.homepage:
        return MaterialPageRoute(builder: (context)=> const HomePage());
      case RouteName.studentlogin:
        return MaterialPageRoute(builder: (context)=>const SLoginPage());
      case RouteName.adminlogin:
        return MaterialPageRoute(builder: (context)=>const AdminLoginPage());
      case RouteName.announcement:
        return MaterialPageRoute(builder: (context)=> Announcement());
      case RouteName.hostelfaculty:
        return MaterialPageRoute(builder: (context)=>const HostelFacultyPage());
      case RouteName.studentprofile:
        return MaterialPageRoute(builder: (context)=>const StudentProfile());
      case RouteName.studentdashboard:
        return MaterialPageRoute(builder: (context)=>const StudentDashboardPage());
      case RouteName.admindashboard:
        return MaterialPageRoute(builder: (context)=>const AdminDashboard());
      case RouteName.complaint:
        return MaterialPageRoute(builder: (context)=>Complain());
      case RouteName.mycomplaint:
        return MaterialPageRoute(builder: (context)=>const MyComplaint());
      case RouteName.newspage:
        return MaterialPageRoute(builder: (context)=>NewsPage());
      case RouteName.adminprofile:
        return MaterialPageRoute(builder: (context)=>const AdminProfile());
      case RouteName.aboutpage:
        return MaterialPageRoute(builder: (context)=>const AboutPage());
      case RouteName.trackcomplain:
        return MaterialPageRoute(builder: (context)=>const TrackComplain());
      case RouteName.announcementview:
        return MaterialPageRoute(builder: (context)=>const AnnouncementView());
      case RouteName.complainview:
        return MaterialPageRoute(builder: (context)=>const ComplainView());
      case RouteName.globalcomplain:
        return MaterialPageRoute(builder: (context)=>const GlobalComplain());

      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
            body: Center(child: Text("Some thing went Wrong"),),
          );
        });
    }
  }
}