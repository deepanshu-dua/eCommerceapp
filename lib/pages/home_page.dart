import 'dart:convert';
import 'dart:ffi';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_course/models/catalog.dart';
import 'package:flutter_course/widget/item_widget.dart';

import '../widget/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "deepanshu";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // print(catalogJson);
    var decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    catalogModel.Items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(50, (index) => catalogModel.Items[0]);
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
        child: (catalogModel.Items != null && catalogModel.Items!.isNotEmpty)
            ? ListView.builder(
                itemCount: catalogModel.Items!.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: catalogModel.Items![index],
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
