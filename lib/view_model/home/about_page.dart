import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "About of App".text.scale(1.3).letterSpacing(1).make(),
      ),
      body: SafeArea(
        child:Material(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                   ListTile(
                    title: "Inroduction".text.scale(1.5).make(),
                    subtitle: "\nHostel grievance residential applications that help hostlers to complain their problem easily, here admin can access all issues hostlers easily. Our mission helps students and authority on a single platform where they will be able to solve their issues. This application has a good user interface and is easy to access."
                        .text.scale(1).make(),
                ),
                SizedBox(height: 8,),
                ListTile(
                  title: "Main features".text.scale(1.5).make(),

                  subtitle: "\n●\tStudents\n\n\t\t\t➢They can easily complain about their issues."
                      "\n\n\t\t\t➢\tTrack the progress of their problem."
                      .text.scale(1).make(),
                ),
                ListTile(
                    title: "\n●\tAdmin".text.make(),
                    subtitle: "\n\t\t\t➢\tComplaints can view and decide whether it will be approved \n\t\t\t\t\t\t\t\tor rejected."
                        "\n\n\t\t\t➢\tAnnouncement for hostlers.".text.make(),
                ),
                SizedBox(height: 8,),
                ListTile(
                  title: "Authority".text.scale(1.5).make(),
                  subtitle: "\nMain authority in the hand of warden."
                      "\nAdmin can see complaints and take decisions over that complaint."
                      "\nAdmin can make announcements related to the hostel.".text.scale(1).make(),
                ),
                SizedBox(height: 8,),
                ListTile(
                  title: "Policy".text.scale(1.5).make(),
                  subtitle: "\nhe data will be safe and private which will be used to identify the users in the application. Data will be required as the user's name, phone number, main address, date of birth, room number and registration number.".text.scale(1).make(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
