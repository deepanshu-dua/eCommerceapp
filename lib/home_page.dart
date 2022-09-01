import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my app"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to 3 days of flutter"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
