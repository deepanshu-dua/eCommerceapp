import 'package:flutter/material.dart';

import '../widget/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 1,
        // iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "My App",
          // style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to 3 days of flutter"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
