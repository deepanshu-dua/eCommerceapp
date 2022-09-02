import 'package:flutter/material.dart';
import 'package:flutter_course/pages/home_page.dart';
import 'package:flutter_course/pages/login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.amber,
          fontFamily: GoogleFonts.lato().fontFamily),
      // darkTheme: ThemeData(brightness: Brightness.dark,),
      //  initialRoute: "home",
      routes: {
        "/": (context) => LoginPage(),
        "loginpage": (context) => LoginPage()
      },
    );
  }
}
