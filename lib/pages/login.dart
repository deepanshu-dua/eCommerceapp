import 'package:flutter/material.dart';
import 'package:flutter_course/utilities/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = " ";
  bool changeButton = false;

  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Form(
        key: _formkey,
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
              "welcome $name",
              style: TextStyle(
                fontSize: 31,
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
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.face),
                        labelText: "UserName",
                        hintText: "enter username"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return " username cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "Password",
                        hintText: "enter password"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return " password cannot be empty";
                      } else if (value.length < 6) {
                        return "pass must be of more than 6 character";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      width: changeButton ? 80 : 200,
                      duration: Duration(seconds: 1),
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 80 : 15)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}





        // child: Center(
        //   child: Text(
        //     "Login Page",
        //     style: TextStyle(fontSize: 20, color: Colors.blue),
        //     textScaleFactor: 2.0,
        //   ),
        // ),

                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   child: Text(
                  //     "Login",
                  //     style: TextStyle(fontSize: 23),
                  //   ),
                  //   style: TextButton.styleFrom(minimumSize: Size(250, 40)),

                  // )