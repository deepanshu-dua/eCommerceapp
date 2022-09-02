import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Image.asset(
          "assets/images/login.png",
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          "welcome",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: "UserName", hintText: "enter username"),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password", hintText: "enter password"),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  print("hi deepu");
                },
                child: Text("Login"),
                style: TextButton.styleFrom(),
              )
            ],
          ),
        ),
      ],
    )
        // child: Center(
        //   child: Text(
        //     "Login Page",
        //     style: TextStyle(fontSize: 20, color: Colors.blue),
        //     textScaleFactor: 2.0,
        //   ),
        // ),
        );
  }
}
