import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://pbs.twimg.com/profile_images/1268073836458602496/-cjBXA6G_400x400.jpg";
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
                // decoration: BoxDecoration(color: Colors.grey.shade600),
                margin: EdgeInsets.zero,
                accountName: Text("Deepanshu"),
                accountEmail: Text("deepanshudua777@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                )),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              textScaleFactor: 1.5,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
            ),
            title: Text(
              "Profile",
              textScaleFactor: 1.5,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.bell,
              color: Colors.white,
            ),
            title: Text(
              "Offers",
              textScaleFactor: 1.5,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
            title: Text(
              "Inbox",
              textScaleFactor: 1.5,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.settings,
              color: Colors.white,
            ),
            title: Text(
              "Settings",
              textScaleFactor: 1.5,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
