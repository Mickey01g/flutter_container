import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyTheme{
    static ThemeData lightTheme(BuildContext context)=>ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.red,
        elevation: 0.0,
      )
    );
    static ThemeData darkTheme(BuildContext context)=>ThemeData(
      brightness: Brightness.light,
    );
}
