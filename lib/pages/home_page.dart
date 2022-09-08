import 'package:flutter/material.dart';
import 'package:flutter_course/models/catalog.dart';
import 'package:flutter_course/widget/item_widget.dart';

import '../widget/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(50, (index) => catalogModel.Items[0]);
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: dummyList[index],
              );
            }),
      ),
      drawer: MyDrawer(),
    );
  }
}
