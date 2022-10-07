import 'package:flutter/material.dart';
import 'package:flutter_course/pages/cart_page.dart';
import 'package:flutter_course/pages/home_page.dart';
import 'package:flutter_course/pages/login.dart';
import 'package:flutter_course/themes.dart';
import 'package:flutter_course/utilities/routes.dart';
import 'package:google_fonts/google_fonts.dart';
// @dart= 2.9

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,

      // darkTheme: ThemeData(brightness: Brightness.dark,),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
